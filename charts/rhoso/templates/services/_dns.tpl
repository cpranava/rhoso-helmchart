{{/*
DNSMasq section for OpenStackControlPlane.
Ref: DNSMasqSection → networkv1.DNSMasqSpecCore
Values file: values-dns.yaml
*/}}
{{- define "rhoso.dns" -}}
dns:
  enabled: {{ .Values.dns.enabled }}
  {{- with .Values.dns.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
