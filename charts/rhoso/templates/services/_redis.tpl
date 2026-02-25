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
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
