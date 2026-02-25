{{/*
Watcher section for OpenStackControlPlane.
Ref: WatcherSection → watcherv1.WatcherSpecCore
Note: disabled by default upstream.
Values file: values-watcher.yaml
*/}}
{{- define "rhoso.watcher" -}}
watcher:
  enabled: {{ .Values.watcher.enabled }}
  {{- with .Values.watcher.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.watcher.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.watcher.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
