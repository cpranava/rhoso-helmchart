{{/*
RabbitMQ section for OpenStackControlPlane.
Ref: RabbitmqSection → map[string]rabbitmqv1.RabbitMqSpecCore
Note: uses 'templates' (plural/map) — supports multiple RabbitMQ clusters
      Separate clusters for RPC (messagingBus) and notifications (notificationsBus)
      are configured at the global level in values.yaml.
Values file: values-rabbitmq.yaml
*/}}
{{- define "rhoso.rabbitmq" -}}
rabbitmq:
  enabled: {{ .Values.rabbitmq.enabled }}
  {{- with .Values.rabbitmq.templates }}
  templates:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
