{{/*
Heat section for OpenStackControlPlane.
Ref: HeatSection → heatv1.HeatSpecCore
Note: disabled by default upstream.
      Has both apiOverride (Heat API) and cnfAPIOverride (Heat CFN API).
Values file: values-heat.yaml
*/}}
{{- define "rhoso.heat" -}}
heat:
  enabled: {{ .Values.heat.enabled }}
  {{- with .Values.heat.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.heat.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.heat.cnfAPIOverride }}
  cnfAPIOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.heat.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
