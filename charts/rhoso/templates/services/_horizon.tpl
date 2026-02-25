{{/*
Horizon section for OpenStackControlPlane.
Ref: HorizonSection → horizonv1.HorizonSpecCore
Note: disabled by default upstream.
Values file: values-horizon.yaml
*/}}
{{- define "rhoso.horizon" -}}
horizon:
  enabled: {{ .Values.horizon.enabled }}
  {{- with .Values.horizon.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.horizon.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
