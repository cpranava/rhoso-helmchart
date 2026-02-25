{{/*
Octavia section for OpenStackControlPlane.
Ref: OctaviaSection → octaviav1.OctaviaSpecCore
Note: disabled by default upstream.
Values file: values-octavia.yaml
*/}}
{{- define "rhoso.octavia" -}}
octavia:
  enabled: {{ .Values.octavia.enabled }}
  {{- with .Values.octavia.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.octavia.template }}
  template:
    # -- Secret containing OpenStack passwords (required by CRD)
    secret: {{ .secret | default "osp-secret" | quote }}

    # -- MariaDB instance name (required by CRD)
    databaseInstance: {{ .databaseInstance | default "openstack" | quote }}

    # -- MariaDB account name for Octavia
    databaseAccount: {{ .databaseAccount | default "octavia" | quote }}

    # -- Octavia management network attachment name (required by CRD)
    octaviaNetworkAttachment: {{ .octaviaNetworkAttachment | default "octavia" | quote }}

    # -- Apache container image (required by CRD; set by operator from RELATED_IMAGE env)
    apacheContainerImage: {{ .apacheContainerImage | quote }}

    {{- with .serviceAccount }}
    # -- ServiceAccount name managed by the operator
    serviceAccount: {{ . | quote }}
    {{- end }}

    {{- with .memcachedInstance }}
    # -- Memcached instance name
    memcachedInstance: {{ . | quote }}
    {{- end }}

    {{- with .rabbitMqClusterName }}
    # -- RabbitMQ cluster name for RPC messaging
    rabbitMqClusterName: {{ . | quote }}
    {{- end }}

    {{- with .persistenceDatabaseAccount }}
    # -- Persistence database account name
    persistenceDatabaseAccount: {{ . | quote }}
    {{- end }}

    {{- with .redisServiceName }}
    # -- Redis instance name for Octavia jobboard
    redisServiceName: {{ . | quote }}
    {{- end }}

    {{- with .tenantName }}
    # -- OpenStack tenant/project that controls Octavia resources
    tenantName: {{ . | quote }}
    {{- end }}

    {{- with .apiTimeout }}
    # -- API timeout in seconds
    apiTimeout: {{ . }}
    {{- end }}

    {{- with .amphoraImageContainerImage }}
    # -- Amphora image reference (required for Amphora provider)
    amphoraImageContainerImage: {{ . | quote }}
    {{- end }}

    {{- with .customServiceConfig }}
    # -- Custom oslo.config snippets
    customServiceConfig: {{ . | quote }}
    {{- end }}

    {{- with .octaviaAPI }}
    # -- Octavia API sub-spec (toYaml — includes replicas, databaseInstance, secret, serviceAccount)
    octaviaAPI:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .octaviaHousekeeping }}
    # -- Octavia Housekeeping agent sub-spec (toYaml)
    octaviaHousekeeping:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .octaviaHealthManager }}
    # -- Octavia Health Manager agent sub-spec (toYaml)
    octaviaHealthManager:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .octaviaWorker }}
    # -- Octavia Worker agent sub-spec (toYaml)
    octaviaWorker:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .octaviaRsyslog }}
    # -- Octavia Rsyslog sub-spec (toYaml)
    octaviaRsyslog:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .lbMgmtNetwork }}
    # -- Load balancer management network configuration (toYaml — network params vary)
    lbMgmtNetwork:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for all Octavia pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Octavia endpoints
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
  {{- with .Values.octavia.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
