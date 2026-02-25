{{/*
Manila section for OpenStackControlPlane.
Ref: ManilaSection → manilav1.ManilaSpecCore
Note: disabled by default upstream.
Values file: values-manila.yaml
*/}}
{{- define "rhoso.manila" -}}
manila:
  enabled: {{ .Values.manila.enabled }}
  {{- with .Values.manila.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.manila.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.manila.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
