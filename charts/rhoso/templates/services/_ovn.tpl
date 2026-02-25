{{/*
OVN section for OpenStackControlPlane.
Ref: OvnSection → OvnResources { OVNDBCluster map, OVNNorthd, OVNController }
Note: template contains three sub-resources:
  - ovnDBCluster: map[string]OVNDBClusterSpecCore (supports multiple DB clusters)
  - ovnNorthd:    OVNNorthdSpecCore
  - ovnController: OVNControllerSpecCore
Values file: values-ovn.yaml
*/}}
{{- define "rhoso.ovn" -}}
ovn:
  enabled: {{ .Values.ovn.enabled }}
  {{- with .Values.ovn.template }}
  template:
    {{- with .ovnDBCluster }}
    ovnDBCluster:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with .ovnNorthd }}
    ovnNorthd:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with .ovnController }}
    ovnController:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end }}
{{- end }}
