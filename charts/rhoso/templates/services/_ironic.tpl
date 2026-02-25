{{/*
Ironic section for OpenStackControlPlane.
Ref: IronicSection → ironicv1.IronicSpecCore
Note: disabled by default upstream.
      Has both apiOverride (Ironic API) and inspectorOverride (Ironic Inspector).
Values file: values-ironic.yaml
*/}}
{{- define "rhoso.ironic" -}}
ironic:
  enabled: {{ .Values.ironic.enabled }}
  {{- with .Values.ironic.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.ironic.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.ironic.inspectorOverride }}
  inspectorOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.ironic.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
