{{/*
Cinder section for OpenStackControlPlane.
Ref: CinderSection → cinderv1.CinderSpecCore
Note: uniquePodNames avoids pod name collisions between deployments.
Values file: values-cinder.yaml
*/}}
{{- define "rhoso.cinder" -}}
cinder:
  enabled: {{ .Values.cinder.enabled }}
  {{- with .Values.cinder.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.cinder.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- if .Values.cinder.uniquePodNames }}
  uniquePodNames: {{ .Values.cinder.uniquePodNames }}
  {{- end }}
  {{- with .Values.cinder.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
