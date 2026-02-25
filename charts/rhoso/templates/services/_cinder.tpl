{{/*
Cinder section for OpenStackControlPlane.
Ref: CinderSection → cinderv1.CinderSpecCore
Note: uniquePodNames avoids pod name collisions between deployments.
Values file: values-cinder.yaml
*/}}
{{- define "rhoso.cinder" -}}
cinder:
  enabled: {{ .Values.cinder.enabled }}
  {{- with .Values.cinder.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- if .Values.cinder.uniquePodNames }}
  uniquePodNames: {{ .Values.cinder.uniquePodNames }}
  {{- end }}
  {{- with .Values.cinder.template }}
  template:
    # -- Secret containing OpenStack passwords (required by CRD)
    secret: {{ .secret | default "osp-secret" | quote }}

    # -- MariaDB instance name (required by CRD)
    databaseInstance: {{ .databaseInstance | default "openstack" | quote }}

    # -- MariaDB account name for Cinder
    databaseAccount: {{ .databaseAccount | default "cinder" | quote }}

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
    # -- Custom oslo.config snippets appended to cinder.conf
    customServiceConfig: {{ . | quote }}
    {{- end }}

    {{- with .cinderAPI }}
    # -- Cinder API sub-spec (toYaml — includes replicas, override, resources, networkAttachments)
    cinderAPI:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .cinderScheduler }}
    # -- Cinder Scheduler sub-spec
    cinderScheduler:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .cinderBackup }}
    # -- Cinder Backup sub-spec
    cinderBackup:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .cinderVolumes }}
    # -- Cinder Volume backends (toYaml — storage backends vary heavily per deployment)
    cinderVolumes:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for all Cinder pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Cinder endpoints
    tls:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .topologyRef }}
    # -- Topology spread reference
    topologyRef:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end }}
  {{- with .Values.cinder.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
