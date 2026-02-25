{{/*
Nova section for OpenStackControlPlane.
Ref: NovaSection → novav1.NovaSpecCore
Note: cellOverride is a map[string]NovaCellOverrideSpec
      cell0 never has compute nodes and won't have noVNCProxy.
Values file: values-nova.yaml
*/}}
{{- define "rhoso.nova" -}}
nova:
  enabled: {{ .Values.nova.enabled }}
  {{- with .Values.nova.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.nova.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.nova.cellOverride }}
  cellOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.nova.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
