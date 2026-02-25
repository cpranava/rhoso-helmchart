{{/*
TLS section for OpenStackControlPlane.
Ref: TLSSection in openstackcontrolplane_types.go
*/}}
{{- define "rhoso.tls" -}}
tls:
  {{- toYaml .Values.tls | nindent 2 }}
{{- end }}
