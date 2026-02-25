{{/*
Glance section for OpenStackControlPlane.
Ref: GlanceSection → glancev1.GlanceSpecCore
Note: uses 'apiOverrides' (plural/map) not 'apiOverride'.
      uniquePodNames avoids pod name collisions between deployments.
Values file: values-glance.yaml
*/}}
{{- define "rhoso.glance" -}}
glance:
  enabled: {{ .Values.glance.enabled }}
  {{- with .Values.glance.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.glance.apiOverrides }}
  apiOverrides:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- if .Values.glance.uniquePodNames }}
  uniquePodNames: {{ .Values.glance.uniquePodNames }}
  {{- end }}
  {{- with .Values.glance.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
