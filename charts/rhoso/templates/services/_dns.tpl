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
    # -- Number of dnsmasq replicas to run
    replicas: {{ .replicas | default 1 }}

    {{- with .options }}
    # -- Custom dnsmasq options (e.g. upstream DNS servers)
    options:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .networkAttachments }}
    # -- Additional Multus network attachments
    networkAttachments:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .externalEndpoints }}
    # -- External endpoints that dnsmasq should override / serve
    externalEndpoints:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .override }}
    # -- Override of the generated Service (e.g. to add annotations)
    override:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .resources }}
    # -- Resource requests/limits for the dnsmasq container
    resources:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for dnsmasq pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}


    {{- with .extraSpec }}
    # -- Escape hatch: passthrough for unsupported CRD fields
    extraSpec:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with .topologyRef }}
    # -- Topology spread reference
    topologyRef:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end }}
{{- end }}
