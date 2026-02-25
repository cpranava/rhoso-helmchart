{{/*
Glance section for OpenStackControlPlane.
Ref: GlanceSection → glancev1.GlanceSpecCore
Note: uses 'apiOverrides' (plural/map) not 'apiOverride'.
      uniquePodNames avoids pod name collisions between deployments.
Values file: values-glance.yaml
*/}}
{{- define "rhoso.glance" -}}
glance:
  enabled: {{ .Values.glance.enabled }}
  {{- with .Values.glance.apiOverrides }}
  apiOverrides:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- if .Values.glance.uniquePodNames }}
  uniquePodNames: {{ .Values.glance.uniquePodNames }}
  {{- end }}
  {{- with .Values.glance.template }}
  template:
    # -- Secret containing OpenStack passwords (required by CRD)
    secret: {{ .secret | default "osp-secret" | quote }}

    # -- MariaDB instance name (required by CRD)
    databaseInstance: {{ .databaseInstance | default "openstack" | quote }}

    # -- MariaDB account name for Glance
    databaseAccount: {{ .databaseAccount | default "glance" | quote }}

    # -- Memcached instance name (required by CRD)
    memcachedInstance: {{ .memcachedInstance | default "memcached" | quote }}

    # -- Keystone endpoint type used to register Glance (required by CRD)
    keystoneEndpoint: {{ .keystoneEndpoint | default "public" | quote }}

    {{- with .serviceAccount }}
    # -- ServiceAccount name managed by the operator
    serviceAccount: {{ . | quote }}
    {{- end }}

    {{- if .storageRequest }}
    # -- Storage size request for the image store PVC
    storageRequest: {{ .storageRequest | quote }}
    {{- end }}

    {{- if .storageClass }}
    # -- StorageClass override for the image store PVC
    storageClass: {{ .storageClass | quote }}
    {{- end }}

    {{- with .imageCache }}
    # -- Image cache settings (toYaml — cache config varies per deployment)
    imageCache:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .customServiceConfig }}
    # -- Custom oslo.config snippets appended to glance-api.conf
    customServiceConfig: {{ . | quote }}
    {{- end }}

    {{- with .glanceAPIs }}
    # -- Named GlanceAPI instances (toYaml — complex per-API config varies)
    glanceAPIs:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .networkAttachments }}
    # -- Additional Multus network attachments
    networkAttachments:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .resources }}
    # -- Resource requests/limits
    resources:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for all Glance API pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Glance endpoints
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
  {{- with .Values.glance.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
