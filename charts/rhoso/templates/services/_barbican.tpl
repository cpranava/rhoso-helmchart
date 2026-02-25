{{/*
Barbican section for OpenStackControlPlane.
Ref: BarbicanSection → barbicanv1.BarbicanSpecCore
Note: enabled by default upstream.
Values file: values-barbican.yaml
*/}}
{{- define "rhoso.barbican" -}}
barbican:
  enabled: {{ .Values.barbican.enabled }}
  {{- with .Values.barbican.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.barbican.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.barbican.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
