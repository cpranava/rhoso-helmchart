{{/*
Heat section for OpenStackControlPlane.
Ref: HeatSection → heatv1.HeatSpecCore
Note: disabled by default upstream.
      Has both apiOverride (Heat API) and cnfAPIOverride (Heat CFN API).
Values file: values-heat.yaml
*/}}
{{- define "rhoso.heat" -}}
heat:
  enabled: {{ .Values.heat.enabled }}
  {{- with .Values.heat.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.heat.cnfAPIOverride }}
  cnfAPIOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.heat.template }}
  template:
    # -- Secret containing OpenStack passwords (required by CRD)
    secret: {{ .secret | default "osp-secret" | quote }}

    # -- MariaDB instance name (required by CRD)
    databaseInstance: {{ .databaseInstance | default "openstack" | quote }}

    # -- MariaDB account name for Heat
    databaseAccount: {{ .databaseAccount | default "heat" | quote }}

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
    # -- Custom oslo.config snippets appended to heat.conf
    customServiceConfig: {{ . | quote }}
    {{- end }}

    {{- with .heatAPI }}
    # -- Heat API sub-spec (replicas explicit; rest toYaml for override/resources)
    heatAPI:
      # -- Number of Heat API replicas
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

    {{- with .heatCfnAPI }}
    # -- Heat CFN API sub-spec
    heatCfnAPI:
      # -- Number of Heat CFN API replicas
      replicas: {{ .replicas | default 1 }}
      {{- with .override }}
      override:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .resources }}
      resources:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}

    {{- with .heatEngine }}
    # -- Heat Engine sub-spec
    heatEngine:
      # -- Number of Heat Engine replicas
      replicas: {{ .replicas | default 1 }}
      {{- with .resources }}
      resources:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for all Heat pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Heat endpoints
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
  {{- with .Values.heat.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
