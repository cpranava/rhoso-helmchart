{{/*
Swift section for OpenStackControlPlane.
Ref: SwiftSection → swiftv1.SwiftSpecCore
Note: Uses 'proxyOverride' (not 'apiOverride') for the Swift Proxy service.
Values file: values-swift.yaml
*/}}
{{- define "rhoso.swift" -}}
swift:
  enabled: {{ .Values.swift.enabled }}
  {{- with .Values.swift.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.swift.proxyOverride }}
  proxyOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.swift.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
