{{/*
Redis section for OpenStackControlPlane.
Ref: RedisSection → map[string]redisv1.RedisSpecCore
Note: disabled by default upstream.
      Uses 'templates' (plural/map) — supports multiple Redis instances.
Values file: values-redis.yaml
*/}}
{{- define "rhoso.redis" -}}
redis:
  enabled: {{ .Values.redis.enabled }}
  {{- with .Values.redis.templates }}
  templates:
    {{- range $name, $inst := . }}
    # -- Named Redis instance: {{ $name }}
    {{ $name }}:
      # -- Number of Redis replicas (with Sentinel for HA)
      replicas: {{ $inst.replicas | default 1 }}

      {{- with $inst.resources }}
      # -- Resource requests/limits for the Redis container
      resources:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with $inst.sentinelResources }}
      # -- Resource requests/limits for Sentinel containers
      sentinelResources:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with $inst.tls }}
      # -- TLS settings for Redis connections
      tls:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with $inst.nodeSelector }}
      # -- Node selector for Redis pods
      nodeSelector:
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
