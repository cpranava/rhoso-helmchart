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
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
