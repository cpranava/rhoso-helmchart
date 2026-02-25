{{/*
Designate section for OpenStackControlPlane.
Ref: DesignateSection → designatev1.DesignateSpecCore
Note: disabled by default upstream.
Values file: values-designate.yaml
*/}}
{{- define "rhoso.designate" -}}
designate:
  enabled: {{ .Values.designate.enabled }}
  {{- with .Values.designate.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.designate.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.designate.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
