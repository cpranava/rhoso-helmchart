{{/*
Ironic section for OpenStackControlPlane.
Ref: IronicSection → ironicv1.IronicSpecCore
Note: disabled by default upstream.
      Has both apiOverride (Ironic API) and inspectorOverride (Ironic Inspector).
Values file: values-ironic.yaml
*/}}
{{- define "rhoso.ironic" -}}
ironic:
  enabled: {{ .Values.ironic.enabled }}
  {{- with .Values.ironic.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.ironic.inspectorOverride }}
  inspectorOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.ironic.template }}
  template:
    # -- Secret containing OpenStack passwords (required by CRD)
    secret: {{ .secret | default "osp-secret" | quote }}

    # -- MariaDB instance name (required by CRD)
    databaseInstance: {{ .databaseInstance | default "openstack" | quote }}

    # -- MariaDB account name for Ironic
    databaseAccount: {{ .databaseAccount | default "ironic" | quote }}

    # -- StorageClass for Ironic conductor PVCs (required by CRD; empty uses global)
    storageClass: {{ .storageClass | default "" | quote }}

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

    {{- with .rpcTransport }}
    # -- RPC transport type (oslo or json-rpc)
    rpcTransport: {{ . | quote }}
    {{- end }}

    {{- if .standalone }}
    # -- Enable standalone mode (no Keystone)
    standalone: {{ .standalone }}
    {{- end }}

    {{- with .customServiceConfig }}
    # -- Custom oslo.config snippets appended to ironic.conf
    customServiceConfig: {{ . | quote }}
    {{- end }}

    {{- with .ironicAPI }}
    # -- Ironic API sub-spec (toYaml — includes override, resources, networkAttachments)
    ironicAPI:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .ironicConductors }}
    # -- Ironic Conductor sub-spec list (toYaml — storageRequest varies per conductor)
    ironicConductors:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .ironicInspector }}
    # -- Ironic Inspector sub-spec (toYaml — dhcpRanges vary per deployment)
    ironicInspector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .ironicNeutronAgent }}
    # -- Ironic Neutron Agent sub-spec
    ironicNeutronAgent:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .networkAttachments }}
    # -- Additional Multus network attachments for the main service
    networkAttachments:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for all Ironic pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Ironic endpoints
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
  {{- with .Values.ironic.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
