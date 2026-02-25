{{/*
Designate section for OpenStackControlPlane.
Ref: DesignateSection → designatev1.DesignateSpecCore
Note: disabled by default upstream.
Values file: values-designate.yaml
*/}}
{{- define "rhoso.designate" -}}
designate:
  enabled: {{ .Values.designate.enabled }}
  {{- with .Values.designate.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.designate.template }}
  template:
    # -- Secret containing OpenStack passwords (required by CRD)
    secret: {{ .secret | default "osp-secret" | quote }}

    # -- MariaDB instance name (required by CRD)
    databaseInstance: {{ .databaseInstance | default "openstack" | quote }}

    # -- MariaDB account name for Designate
    databaseAccount: {{ .databaseAccount | default "designate" | quote }}

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

    {{- with .redisServiceName }}
    # -- Redis instance name for Designate
    redisServiceName: {{ . | quote }}
    {{- end }}

    {{- with .customServiceConfig }}
    # -- Custom oslo.config snippets appended to designate.conf
    customServiceConfig: {{ . | quote }}
    {{- end }}

    {{- with .backendType }}
    # -- DNS backend type: bind9 | unbound | powerdns
    backendType: {{ . | quote }}
    {{- end }}

    {{- with .nsRecords }}
    # -- Nameserver records for the Designate pool (toYaml — list of hostname/priority)
    nsRecords:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .networkAttachments }}
    # -- Additional Multus network attachments
    networkAttachments:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .designateAPI }}
    # -- Designate API sub-spec (toYaml — includes replicas, override, resources, networkAttachments)
    designateAPI:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .designateCentral }}
    # -- Designate Central sub-spec (toYaml)
    designateCentral:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .designateWorker }}
    # -- Designate Worker sub-spec (toYaml)
    designateWorker:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .designateMdns }}
    # -- Designate Mdns sub-spec (toYaml)
    designateMdns:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .designateProducer }}
    # -- Designate Producer sub-spec (toYaml)
    designateProducer:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .designateBackendbind9 }}
    # -- Designate Backendbind9 sub-spec (toYaml)
    designateBackendbind9:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .designateUnbound }}
    # -- Designate Unbound sub-spec (toYaml)
    designateUnbound:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for all Designate pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Designate endpoints
    tls:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .topologyRef }}
    # -- Topology spread reference
    topologyRef:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end }}
  {{- with .Values.designate.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
