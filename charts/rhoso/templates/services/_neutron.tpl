{{/*
Neutron section for OpenStackControlPlane.
Ref: NeutronSection → neutronv1.NeutronAPISpecCore
Values file: values-neutron.yaml
*/}}
{{- define "rhoso.neutron" -}}
neutron:
  enabled: {{ .Values.neutron.enabled }}
  {{- with .Values.neutron.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.neutron.template }}
  template:
    # -- Number of Neutron API replicas
    replicas: {{ .replicas | default 1 }}

    # -- Secret containing OpenStack passwords (required by CRD)
    secret: {{ .secret | default "osp-secret" | quote }}

    # -- MariaDB instance name (required by CRD)
    databaseInstance: {{ .databaseInstance | default "openstack" | quote }}

    # -- MariaDB account name for Neutron
    databaseAccount: {{ .databaseAccount | default "neutron" | quote }}

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
    # -- Custom oslo.config snippets appended to neutron.conf
    customServiceConfig: {{ . | quote }}
    {{- end }}

    {{- with .networkAttachments }}
    # -- Additional Multus network attachments
    networkAttachments:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .resources }}
    # -- Resource requests/limits for the Neutron API container
    resources:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for Neutron API pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .override }}
    # -- Override the generated Service or Route
    override:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Neutron endpoints
    tls:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .topologyRef }}
    # -- Topology spread reference
    topologyRef:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end }}
  {{- with .Values.neutron.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
