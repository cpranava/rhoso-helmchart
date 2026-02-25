{{/*
Octavia section for OpenStackControlPlane.
Ref: OctaviaSection → octaviav1.OctaviaSpecCore
Note: disabled by default upstream.
Values file: values-octavia.yaml
*/}}
{{- define "rhoso.octavia" -}}
octavia:
  enabled: {{ .Values.octavia.enabled }}
  {{- with .Values.octavia.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.octavia.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.octavia.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
