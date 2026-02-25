{{/*
Memcached section for OpenStackControlPlane.
Ref: MemcachedSection → map[string]memcachedv1.MemcachedSpecCore
Note: uses 'templates' (plural/map) — supports multiple Memcached instances
Values file: values-memcached.yaml
*/}}
{{- define "rhoso.memcached" -}}
memcached:
  enabled: {{ .Values.memcached.enabled }}
  {{- with .Values.memcached.templates }}
  templates:
    {{- range $name, $inst := . }}
    # -- Named Memcached instance: {{ $name }}
    {{ $name }}:
      # -- Number of Memcached replicas
      replicas: {{ $inst.replicas | default 1 }}

      {{- if $inst.maxMemoryMB }}
      # -- Maximum memory (in MB) for this Memcached instance
      maxMemoryMB: {{ $inst.maxMemoryMB }}
      {{- end }}

      {{- with $inst.resources }}
      # -- Resource requests/limits for the Memcached container
      resources:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with $inst.nodeSelector }}
      # -- Node selector override for this instance
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with $inst.tls }}
      # -- TLS settings
      tls:
        {{- toYaml . | nindent 8 }}
      {{- end }}


      {{- with $inst.extraSpec }}
      # -- Escape hatch: passthrough for unsupported CRD fields
      extraSpec:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $inst.topologyRef }}
      # -- Topology spread reference
      topologyRef:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end }}
