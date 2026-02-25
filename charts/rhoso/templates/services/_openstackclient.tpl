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
    # -- ConfigMap containing clouds.yaml (created automatically by the operator)
    openStackConfigMap: {{ .Values.openstackclient.template.openStackConfigMap | default "openstack-config" | quote }}

    # -- Secret containing secure.yaml / passwords (created automatically by the operator)
    openStackConfigSecret: {{ .Values.openstackclient.template.openStackConfigSecret | default "openstack-config-secret" | quote }}

    {{- with .Values.openstackclient.template.caBundleSecretName }}
    # -- Optional: additional CA certificates to trust inside the client pod
    caBundleSecretName: {{ . | quote }}
    {{- end }}

    {{- with .Values.openstackclient.template.nodeSelector }}
    # -- Restrict the client pod to specific nodes
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .Values.openstackclient.template.env }}
    # -- Extra environment variables injected into the client pod
    env:
      {{- toYaml . | nindent 6 }}
    {{- end }}


    {{- with .Values.openstackclient.template.extraSpec }}
    # -- Escape hatch: passthrough for unsupported CRD fields
    extraSpec:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with .Values.openstackclient.template.topologyRef }}
    # -- Topology spread reference
    topologyRef:
      {{- toYaml . | nindent 6 }}
    {{- end }}
{{- end }}
