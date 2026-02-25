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
    {{- range $name, $inst := . }}
    # -- Named RabbitMQ cluster instance: {{ $name }}
    {{ $name }}:
      # -- Number of RabbitMQ replicas
      replicas: {{ $inst.replicas | default 1 }}

      {{- with $inst.resources }}
      # -- Resource requests/limits for the RabbitMQ container
      resources:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with $inst.override }}
      # -- Override the generated Service (e.g. annotations)
      override:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with $inst.advancedConfig }}
      # -- RabbitMQ advanced.config content (Erlang terms)
      #    Applied verbatim by the operator; use for low-level broker tuning.
      advancedConfig: |-
        {{- . | nindent 8 }}
      {{- end }}

      {{- with $inst.additionalConfig }}
      # -- RabbitMQ additional.conf content (INI-style)
      additionalConfig: |-
        {{- . | nindent 8 }}
      {{- end }}

      {{- with $inst.nodeSelector }}
      # -- Node selector override for this cluster
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with $inst.tls }}
      # -- TLS settings for intra-cluster communication
      tls:
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
