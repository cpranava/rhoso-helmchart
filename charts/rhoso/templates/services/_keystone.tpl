{{/*
Keystone section for OpenStackControlPlane.
Ref: KeystoneSection → keystonev1.KeystoneAPISpecCore
Values file: values-keystone.yaml
*/}}
{{- define "rhoso.keystone" -}}
keystone:
  enabled: {{ .Values.keystone.enabled }}
  {{- with .Values.keystone.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.keystone.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
