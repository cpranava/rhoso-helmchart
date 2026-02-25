{{/*
Barbican section for OpenStackControlPlane.
Ref: BarbicanSection → barbicanv1.BarbicanSpecCore
Note: enabled by default upstream.
Values file: values-barbican.yaml
*/}}
{{- define "rhoso.barbican" -}}
barbican:
  enabled: {{ .Values.barbican.enabled }}
  {{- with .Values.barbican.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.barbican.template }}
  template:
    # -- Secret containing OpenStack passwords (required by CRD)
    secret: {{ .secret | default "osp-secret" | quote }}

    # -- MariaDB instance name (required by CRD)
    databaseInstance: {{ .databaseInstance | default "openstack" | quote }}

    # -- MariaDB account name for Barbican
    databaseAccount: {{ .databaseAccount | default "barbican" | quote }}

    # -- Memcached instance name (required by CRD)
    memcachedInstance: {{ .memcachedInstance | default "memcached" | quote }}

    # -- ServiceAccount name (required by CRD; created by operator)
    serviceAccount: {{ .serviceAccount | default "barbican" | quote }}

    {{- with .rabbitMqClusterName }}
    # -- RabbitMQ cluster name for RPC messaging
    rabbitMqClusterName: {{ . | quote }}
    {{- end }}

    {{- with .customServiceConfig }}
    # -- Custom oslo.config snippets appended to barbican.conf
    customServiceConfig: {{ . | quote }}
    {{- end }}

    {{- with .apiTimeout }}
    # -- Barbican API timeout in seconds (default: 90)
    apiTimeout: {{ . }}
    {{- end }}

    {{- with .barbicanAPI }}
    # -- Barbican API sub-spec (toYaml — includes replicas, override, resources, networkAttachments)
    barbicanAPI:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .barbicanWorker }}
    # -- Barbican Worker sub-spec (toYaml)
    barbicanWorker:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .barbicanKeystoneListener }}
    # -- Barbican Keystone Listener sub-spec (toYaml)
    barbicanKeystoneListener:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .networkAttachments }}
    # -- Additional Multus network attachments
    networkAttachments:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for all Barbican pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Barbican endpoints
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
  {{- with .Values.barbican.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
