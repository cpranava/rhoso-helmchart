{{/*
Watcher section for OpenStackControlPlane.
Ref: WatcherSection → watcherv1.WatcherSpecCore
Note: disabled by default upstream.
      CRD field names differ from other services:
        watcherAPI            → apiServiceTemplate
        watcherApplier        → applierServiceTemplate
        watcherDecisionEngine → decisionengineServiceTemplate
Values file: values-watcher.yaml
*/}}
{{- define "rhoso.watcher" -}}
watcher:
  enabled: {{ .Values.watcher.enabled }}
  {{- with .Values.watcher.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.watcher.template }}
  template:
    # -- Secret containing OpenStack passwords (required by CRD)
    secret: {{ .secret | default "osp-secret" | quote }}

    # -- MariaDB instance name (required by CRD)
    databaseInstance: {{ .databaseInstance | default "openstack" | quote }}

    # -- MariaDB account name for Watcher
    databaseAccount: {{ .databaseAccount | default "watcher" | quote }}

    # -- Memcached instance name (required by CRD)
    memcachedInstance: {{ .memcachedInstance | default "memcached" | quote }}

    {{- with .serviceAccount }}
    # -- ServiceAccount name managed by the operator
    serviceAccount: {{ . | quote }}
    {{- end }}

    {{- with .rabbitMqClusterName }}
    # -- RabbitMQ cluster name for RPC messaging
    rabbitMqClusterName: {{ . | quote }}
    {{- end }}

    {{- with .customServiceConfig }}
    # -- Custom oslo.config snippets appended to watcher.conf
    customServiceConfig: {{ . | quote }}
    {{- end }}

    {{- with .apiServiceTemplate }}
    # -- Watcher API sub-spec (CRD field: apiServiceTemplate — toYaml)
    apiServiceTemplate:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .applierServiceTemplate }}
    # -- Watcher Applier sub-spec (CRD field: applierServiceTemplate — toYaml)
    applierServiceTemplate:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .decisionengineServiceTemplate }}
    # -- Watcher Decision Engine sub-spec (CRD field: decisionengineServiceTemplate — toYaml)
    decisionengineServiceTemplate:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .dbPurge }}
    # -- DB purge cron job settings (toYaml — schedule and purgeAge vary)
    dbPurge:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for all Watcher pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Watcher endpoints
    tls:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .topologyRef }}
    # -- Topology spread reference
    topologyRef:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end }}
  {{- with .Values.watcher.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
