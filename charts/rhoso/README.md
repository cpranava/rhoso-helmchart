# rhoso — Helm Chart for Red Hat OpenStack Services on OpenShift

Renders an `OpenStackControlPlane` custom resource for deployment via the
[openstack-operator](https://github.com/openstack-k8s-operators/openstack-operator).

Designed for integration with [Red Hat Validated Patterns](https://validatedpatterns.io/).

> ⚠️ The OpenStack operator must be installed on the cluster before applying this chart.

---

## Design

The chart produces a single `OpenStackControlPlane` CR assembled from
**one template partial per service** — making each service's configuration
independently owned and reviewable.

```
templates/
├── controlplane.yaml          ← assembles the CR
└── services/
    ├── _keystone.tpl          ← one file, one service
    ├── _nova.tpl
    ├── _neutron.tpl
    └── ...
```

Per-service configuration lives in dedicated values files:

```
values-keystone.yaml
values-nova.yaml
values-neutron.yaml
...
```

---

## Prerequisites

- OpenShift cluster with the OpenStack operator installed
- `Secret` named `osp-secret` (or overridden via `secret:`) in the target namespace
- `StorageClass` available (default: `local-storage`)
- cert-manager installed (for TLS)

---

## Quick Start

```bash
# Render with defaults only
helm template rhoso . 

# Render with specific service overrides
helm template rhoso . \
  -f values-nova.yaml \
  -f values-neutron.yaml \
  -f values-cinder.yaml

# Deploy
helm install rhoso . -n openstack \
  -f values-nova.yaml \
  -f values-neutron.yaml

# Enable an optional service (e.g. Heat)
helm upgrade rhoso . -n openstack \
  -f values-heat.yaml \
  --set heat.enabled=true
```

---

## Values Files

| File | Service | Enabled by Default |
|---|---|---|
| `values.yaml` | Global config, all enable/disable flags | — |
| `values-tls.yaml` | TLS (ingress + pod-level) | ✅ |
| `values-dns.yaml` | DNSMasq | ✅ |
| `values-galera.yaml` | Galera / MariaDB | ✅ |
| `values-rabbitmq.yaml` | RabbitMQ | ✅ |
| `values-memcached.yaml` | Memcached | ✅ |
| `values-keystone.yaml` | Keystone | ✅ |
| `values-placement.yaml` | Placement | ✅ |
| `values-glance.yaml` | Glance | ✅ |
| `values-cinder.yaml` | Cinder | ✅ |
| `values-ovn.yaml` | OVN (DBCluster NB+SB, Northd, Controller) | ✅ |
| `values-neutron.yaml` | Neutron | ✅ |
| `values-nova.yaml` | Nova (API/Scheduler/Metadata/cell0/cell1) | ✅ |
| `values-swift.yaml` | Swift | ✅ |
| `values-barbican.yaml` | Barbican | ✅ |
| `values-telemetry.yaml` | Telemetry | ✅ |
| `values-openstackclient.yaml` | OpenStackClient | ✅ (always) |
| `values-heat.yaml` | Heat | ❌ |
| `values-ironic.yaml` | Ironic | ❌ |
| `values-manila.yaml` | Manila | ❌ |
| `values-horizon.yaml` | Horizon | ❌ |
| `values-octavia.yaml` | Octavia | ❌ |
| `values-designate.yaml` | Designate | ❌ |
| `values-redis.yaml` | Redis | ❌ |
| `values-watcher.yaml` | Watcher | ❌ |

---

## Validated Patterns Integration

Reference this chart from your pattern's `values-hub.yaml`:

```yaml
applications:
  rhoso:
    name: rhoso
    namespace: openstack
    project: hub
    path: charts/rhoso
    extraValueFiles:
      - values-tls.yaml
      - values-galera.yaml
      - values-rabbitmq.yaml
      - values-memcached.yaml
      - values-keystone.yaml
      - values-placement.yaml
      - values-glance.yaml
      - values-cinder.yaml
      - values-ovn.yaml
      - values-neutron.yaml
      - values-nova.yaml
      - values-swift.yaml
      - values-barbican.yaml
      - values-telemetry.yaml
      - values-openstackclient.yaml
```

Vault secrets are injected via the Vault Secrets Operator or External Secrets
Operator — reference them in the relevant `values-<service>.yaml` file.

---

## Validation

Validate the rendered output without a cluster:

```bash
# Full pipeline: helm lint + YAML check + kubeconform vs real CRD schema
make validate

# Validate with specific values layered
make validate VALUES="-f values-nova.yaml -f values-heat.yaml --set heat.enabled=true"

# First-time setup: downloads CRD schema for kubeconform
make setup-schemas
```

---

## Structure Notes

- **Map-based services** (Galera, RabbitMQ, Memcached, Redis) use `templates:` (plural)
  to support multiple named instances (e.g. `openstack` + `openstack-cell1`)
- **OVN** groups three sub-resources under a single `template:` block
- **Nova** supports cell overrides via `cellOverride:`
- **Heat** has two API overrides: `apiOverride` (Heat API) and `cnfAPIOverride` (CFN API)
- **Glance** uses `apiOverrides:` (plural map) unlike other services
- **Telemetry** has per-sub-service ApplicationCredential fields
