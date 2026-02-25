{{/*
Nova section for OpenStackControlPlane.
Ref: NovaSection → novav1.NovaSpecCore
Note: cellOverride is a map[string]NovaCellOverrideSpec
      cell0 never has compute nodes and won't have noVNCProxy.
Values file: values-nova.yaml
*/}}
{{- define "rhoso.nova" -}}
nova:
  enabled: {{ .Values.nova.enabled }}
  {{- with .Values.nova.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.nova.cellOverride }}
  cellOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.nova.template }}
  template:
    # -- Secret containing OpenStack passwords (required by CRD)
    secret: {{ .secret | default "osp-secret" | quote }}

    # -- MariaDB instance for Nova API and cell0 databases (required by CRD)
    apiDatabaseInstance: {{ .apiDatabaseInstance | default "openstack" | quote }}

    {{- with .memcachedInstance }}
    # -- Memcached instance name
    memcachedInstance: {{ . | quote }}
    {{- end }}

    {{- with .rabbitMqClusterName }}
    # -- RabbitMQ cluster name for API-level messaging
    rabbitMqClusterName: {{ . | quote }}
    {{- end }}

    {{- with .serviceAccount }}
    # -- ServiceAccount name managed by the operator
    serviceAccount: {{ . | quote }}
    {{- end }}

    {{- with .customServiceConfig }}
    # -- Custom oslo.config snippets appended globally to nova.conf
    customServiceConfig: {{ . | quote }}
    {{- end }}

    {{- with .novaAPI }}
    # -- Nova API sub-spec (replicas explicit; rest toYaml for override/resources/networkAttachments)
    novaAPI:
      # -- Number of Nova API replicas
      replicas: {{ .replicas | default 1 }}
      {{- with .override }}
      override:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .resources }}
      resources:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .networkAttachments }}
      networkAttachments:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}

    {{- with .novaScheduler }}
    # -- Nova Scheduler sub-spec
    novaScheduler:
      # -- Number of Nova Scheduler replicas
      replicas: {{ .replicas | default 1 }}
      {{- with .resources }}
      resources:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}

    {{- with .novaMetadata }}
    # -- Nova Metadata sub-spec (top-level, served via the API)
    novaMetadata:
      # -- Number of Nova Metadata replicas
      replicas: {{ .replicas | default 1 }}
      {{- with .resources }}
      resources:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}

    {{- with .cellTemplates }}
    # -- Nova Cell definitions (toYaml — cell configs are highly deployment-specific)
    # Includes: cell0 (mandatory, no compute), cell1+ (with conductor, metadata, noVNCProxy)
    cellTemplates:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for all Nova pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Nova endpoints
    tls:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .topologyRef }}
    # -- Topology spread reference
    topologyRef:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end }}
  {{- with .Values.nova.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
