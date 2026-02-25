# RHOSO Chart Parity Model

This chart uses a hybrid parity model so values can fully express CRD specs while keeping common fields explicit and documented.

## Parity layers

1. **Explicitly templated fields**
   - Common/high-signal fields are rendered directly in each service template (for readability, defaults, and comments).

2. **Nested `toYaml` blocks**
   - Complex sub-objects are passed through with `toYaml` where configuration shape is broad or deployment-specific.

3. **`extraSpec` escape hatch**
   - Each service now supports `extraSpec` passthrough at the service-appropriate level.
   - This allows setting CRD fields not yet explicitly represented in the chart templates.

## Service-by-service `extraSpec` locations

- **barbican**: `barbican.template.extraSpec`
- **cinder**: `cinder.template.extraSpec`
- **designate**: `designate.template.extraSpec`
- **dns**: `dns.template.extraSpec`
- **galera** (map-based): `galera.templates.<instance>.extraSpec`
- **glance**: `glance.template.extraSpec`
- **heat**: `heat.template.extraSpec`
- **horizon**: `horizon.template.extraSpec`
- **ironic**: `ironic.template.extraSpec`
- **keystone**: `keystone.template.extraSpec`
- **manila**: `manila.template.extraSpec`
- **memcached** (map-based): `memcached.templates.<instance>.extraSpec`
- **neutron**: `neutron.template.extraSpec`
- **nova**: `nova.template.extraSpec`
- **octavia**: `octavia.template.extraSpec`
- **openstackclient**: `openstackclient.template.extraSpec`
- **ovn**:
  - `ovn.template.extraSpec`
  - `ovn.template.ovnDBCluster.<instance>.extraSpec`
- **placement**: `placement.template.extraSpec`
- **rabbitmq** (map-based): `rabbitmq.templates.<instance>.extraSpec`
- **redis** (map-based): `redis.templates.<instance>.extraSpec`
- **swift**: `swift.template.extraSpec`
- **telemetry**: `telemetry.template.extraSpec`
- **watcher**: `watcher.template.extraSpec`

## Values documentation

Each `values-*.yaml` includes an `extraSpec` example in the relevant service section (or instance section for map-based services), so operators can discover and use parity passthrough directly from the values docs.
