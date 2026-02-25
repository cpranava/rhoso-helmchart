{{/*
Neutron section for OpenStackControlPlane.
Ref: NeutronSection → neutronv1.NeutronAPISpecCore
Values file: values-neutron.yaml
*/}}
{{- define "rhoso.neutron" -}}
neutron:
  enabled: {{ .Values.neutron.enabled }}
  {{- with .Values.neutron.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.neutron.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.neutron.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
