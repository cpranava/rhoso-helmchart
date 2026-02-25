{{/*
Placement section for OpenStackControlPlane.
Ref: PlacementSection → placementv1.PlacementAPISpecCore
Values file: values-placement.yaml
*/}}
{{- define "rhoso.placement" -}}
placement:
  enabled: {{ .Values.placement.enabled }}
  {{- with .Values.placement.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.placement.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.placement.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
