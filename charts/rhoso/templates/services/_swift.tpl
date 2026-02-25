{{/*
Swift section for OpenStackControlPlane.
Ref: SwiftSection → swiftv1.SwiftSpecCore
Note: Uses 'proxyOverride' (not 'apiOverride') for the Swift Proxy service.
Values file: values-swift.yaml
*/}}
{{- define "rhoso.swift" -}}
swift:
  enabled: {{ .Values.swift.enabled }}
  {{- with .Values.swift.proxyOverride }}
  proxyOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.swift.template }}
  template:
    # -- StorageClass for Swift storage PVCs (empty falls back to global storageClass)
    storageClass: {{ .storageClass | default "" | quote }}

    # -- Memcached instance name (required by CRD)
    memcachedInstance: {{ .memcachedInstance | default "memcached" | quote }}

    {{- with .networkAttachments }}
    # -- Additional Multus network attachments
    networkAttachments:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .ringConfigMaps }}
    # -- Ring ConfigMaps used by the operator
    ringConfigMaps:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for all Swift pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .swiftRing }}
    # -- Swift Ring configuration (toYaml — ring params: partPower, ringReplicas, minPartHours)
    swiftRing:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .swiftStorage }}
    # -- Swift Storage StatefulSet config (toYaml — replicas, storageRequest vary)
    swiftStorage:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .swiftProxy }}
    # -- Swift Proxy config (toYaml — replicas, secret, serviceUser, memcached vary)
    swiftProxy:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Swift endpoints
    tls:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .topologyRef }}
    # -- Topology spread reference
    topologyRef:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end }}
  {{- with .Values.swift.applicationCredential }}
  applicationCredential:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
