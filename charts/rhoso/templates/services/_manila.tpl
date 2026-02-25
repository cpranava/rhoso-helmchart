{{/*
Manila section for OpenStackControlPlane.
Ref: ManilaSection → manilav1.ManilaSpecCore
Note: disabled by default upstream.
Values file: values-manila.yaml
*/}}
{{- define "rhoso.manila" -}}
manila:
  enabled: {{ .Values.manila.enabled }}
  {{- with .Values.manila.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.manila.template }}
  template:
    # -- Secret containing OpenStack passwords (required by CRD)
    secret: {{ .secret | default "osp-secret" | quote }}

    # -- MariaDB instance name (required by CRD)
    databaseInstance: {{ .databaseInstance | default "openstack" | quote }}

    # -- MariaDB account name for Manila
    databaseAccount: {{ .databaseAccount | default "manila" | quote }}

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
    # -- Custom oslo.config snippets appended to manila.conf
    customServiceConfig: {{ . | quote }}
    {{- end }}

    {{- with .manilaAPI }}
    # -- Manila API sub-spec (toYaml — includes replicas, override, resources, networkAttachments)
    manilaAPI:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .manilaScheduler }}
    # -- Manila Scheduler sub-spec
    manilaScheduler:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .manilaShares }}
    # -- Manila Share service backends (toYaml — driver configs vary heavily per deployment)
    manilaShares:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for all Manila pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Manila endpoints
    tls:
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
  {{- with .Values.manila.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
