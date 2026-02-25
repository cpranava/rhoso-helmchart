{{/*
Keystone section for OpenStackControlPlane.
Ref: KeystoneSection → keystonev1.KeystoneAPISpecCore
Values file: values-keystone.yaml
*/}}
{{- define "rhoso.keystone" -}}
keystone:
  enabled: {{ .Values.keystone.enabled }}
  {{- with .Values.keystone.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.keystone.template }}
  template:
    # -- Number of Keystone API replicas
    replicas: {{ .replicas | default 1 }}

    # -- Secret containing OpenStack passwords (required by CRD)
    secret: {{ .secret | default "osp-secret" | quote }}

    # -- MariaDB instance name (required by CRD)
    databaseInstance: {{ .databaseInstance | default "openstack" | quote }}

    # -- MariaDB account name for Keystone
    databaseAccount: {{ .databaseAccount | default "keystone" | quote }}

    # -- Memcached instance name (required by CRD)
    memcachedInstance: {{ .memcachedInstance | default "memcached" | quote }}

    {{- with .serviceAccount }}
    # -- ServiceAccount name managed by the operator
    serviceAccount: {{ . | quote }}
    {{- end }}

    {{- with .customServiceConfig }}
    # -- Custom oslo.config snippets appended to keystone.conf
    customServiceConfig: {{ . | quote }}
    {{- end }}

    {{- with .defaultConfigOverwrite }}
    # -- Override specific config files (e.g. policy.json)
    defaultConfigOverwrite:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .networkAttachments }}
    # -- Additional Multus network attachments
    networkAttachments:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .resources }}
    # -- Resource requests/limits for the Keystone API container
    resources:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for Keystone pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .override }}
    # -- Override the generated Service or Route
    override:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Keystone endpoints
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
  {{- with .Values.keystone.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
