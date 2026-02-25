# RHOSO Helm Chart - Vetting Pipeline
#
# Usage:
#   make lint        - helm lint
#   make template    - render and display
#   make validate    - full pipeline (lint + render + yaml check + kubeconform)
#   make validate VALUES="-f my-values.yaml"  - validate with custom values

HELM        ?= helm
KUBECONFORM ?= kubeconform
CHART       := .
RELEASE     := rhoso
CRD_SCHEMA  ?= file:///tmp/crd-schemas/{{ .ResourceKind }}-{{ .ResourceAPIVersion }}.json
VALUES      ?=

.PHONY: lint template yaml-check kubeconform-check validate setup-schemas

lint:
	$(HELM) lint $(CHART) $(VALUES)

template:
	$(HELM) template $(RELEASE) $(CHART) $(VALUES)

yaml-check:
	@echo "Checking YAML syntax..."
	@$(HELM) template $(RELEASE) $(CHART) $(VALUES) | \
	  python3 -c "import sys, yaml; docs=list(yaml.safe_load_all(sys.stdin)); print(f'OK: {len(docs)} document(s)')"

kubeconform-check: setup-schemas
	@echo "Validating against CRD schema..."
	@$(HELM) template $(RELEASE) $(CHART) $(VALUES) | \
	  $(KUBECONFORM) \
	    -schema-location default \
	    -schema-location '$(CRD_SCHEMA)' \
	    -summary \
	    -verbose \
	    -output pretty

validate: lint yaml-check kubeconform-check
	@echo ""
	@echo "All checks passed ✓"

setup-schemas:
	@if [ ! -f /tmp/crd-schemas/OpenStackControlPlane-v1beta1.json ]; then \
	  echo "Downloading and converting CRD schemas..."; \
	  mkdir -p /tmp/crd-schemas; \
	  curl -fsSL "https://raw.githubusercontent.com/openstack-k8s-operators/openstack-operator/main/api/bases/core.openstack.org_openstackcontrolplanes.yaml" \
	    -o /tmp/core.openstack.org_openstackcontrolplanes.yaml; \
	  python3 -c " \
import yaml, json, os; \
crd=yaml.safe_load(open('/tmp/core.openstack.org_openstackcontrolplanes.yaml')); \
schema=[v['schema']['openAPIV3Schema'] for v in crd['spec']['versions'] if v['name']=='v1beta1'][0]; \
js={'\$$schema':'http://json-schema.org/draft-07/schema#','type':'object',**schema}; \
json.dump(js,open('/tmp/crd-schemas/openstackcontrolplane-v1beta1.json','w')); \
json.dump(js,open('/tmp/crd-schemas/OpenStackControlPlane-v1beta1.json','w')); \
print('Schemas ready') \
"; \
	fi
