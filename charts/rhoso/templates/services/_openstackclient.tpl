{{/*
OpenStackClient section for OpenStackControlPlane.
Ref: OpenStackClientSection → v1beta1.OpenStackClientSpecCore
Note: always deployed — no 'enabled' flag upstream.
Required fields (from CRD, defaults applied by webhook):
  - openStackConfigMap:    "openstack-config"
  - openStackConfigSecret: "openstack-config-secret"
Values file: values-openstackclient.yaml
*/}}
{{- define "rhoso.openstackclient" -}}
openstackclient:
  template:
    {{- toYaml .Values.openstackclient.template | nindent 4 }}
{{- end }}
