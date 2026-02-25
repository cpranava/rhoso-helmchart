{{/*
OVN section for OpenStackControlPlane.
Ref: OvnSection → OvnResources { OVNDBCluster map, OVNNorthd, OVNController }
Note: template contains three sub-resources:
  - ovnDBCluster:   map[string]OVNDBClusterSpecCore (supports multiple DB clusters)
  - ovnNorthd:      OVNNorthdSpecCore
  - ovnController:  OVNControllerSpecCore
Values file: values-ovn.yaml
*/}}
{{- define "rhoso.ovn" -}}
ovn:
  enabled: {{ .Values.ovn.enabled }}
  {{- with .Values.ovn.template }}
  template:
    {{- with .ovnDBCluster }}
    # -- OVN DB Clusters (NB and SB)
    ovnDBCluster:
      {{- range $clusterName, $cluster := . }}
      # -- Named OVN DB cluster instance: {{ $clusterName }}
      {{ $clusterName }}:
        # -- DB type: NB (northbound) or SB (southbound)
        dbType: {{ $cluster.dbType | default "NB" | quote }}

        # -- Number of OVN DB replicas (1 or 3 for HA)
        replicas: {{ $cluster.replicas | default 1 }}

        # -- Storage request for the DB PVC
        storageRequest: {{ $cluster.storageRequest | default "10G" | quote }}

        {{- if $cluster.storageClass }}
        # -- StorageClass override (empty falls back to global)
        storageClass: {{ $cluster.storageClass | quote }}
        {{- end }}

        {{- with $cluster.networkAttachments }}
        # -- Additional Multus network attachments
        networkAttachments:
          {{- toYaml . | nindent 10 }}
        {{- end }}

        {{- with $cluster.nodeSelector }}
        # -- Node selector override for this cluster
        nodeSelector:
          {{- toYaml . | nindent 10 }}
        {{- end }}

        {{- with $cluster.topologyRef }}
        # -- Topology spread reference
        topologyRef:
          {{- toYaml . | nindent 10 }}
        {{- end }}
      {{- end }}
    {{- end }}

    {{- with .ovnNorthd }}
    # -- OVN Northd (translates between northbound and southbound DBs)
    ovnNorthd:
      # -- Number of ovn-northd replicas
      replicas: {{ .replicas | default 1 }}

      {{- with .networkAttachments }}
      # -- Additional Multus network attachments
      networkAttachments:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with .resources }}
      # -- Resource requests/limits for ovn-northd
      resources:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with .nodeSelector }}
      # -- Node selector for ovn-northd pods
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with .topologyRef }}
      # -- Topology spread reference
      topologyRef:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}

    {{- with .ovnController }}
    # -- OVN Controller (DaemonSet on compute/gateway nodes)
    ovnController:
      {{- with .networkAttachments }}
      # -- Additional Multus network attachments
      networkAttachments:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with .nicMappings }}
      # -- NIC to bridge mappings (toYaml — per-node hardware varies)
      nicMappings:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with .externalIDS }}
      # -- OVN external IDs configuration (toYaml — complex per-deployment)
      externalIDS:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with .resources }}
      # -- Resource requests/limits for the OVN controller container
      resources:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with .nodeSelector }}
      # -- Node selector (scope to compute/gateway nodes as needed)
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with .topologyRef }}
      # -- Topology spread reference
      topologyRef:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end }}
