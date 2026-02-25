{{/*
Galera (MariaDB) section for OpenStackControlPlane.
Ref: GaleraSection → map[string]mariadbv1.GaleraSpecCore
Note: uses 'templates' (plural/map) — supports multiple Galera clusters
Values file: values-galera.yaml
*/}}
{{- define "rhoso.galera" -}}
galera:
  enabled: {{ .Values.galera.enabled }}
  {{- with .Values.galera.templates }}
  templates:
    {{- range $name, $inst := . }}
    # -- Named Galera cluster instance: {{ $name }}
    {{ $name }}:
      # -- Number of Galera replicas (1 or 3 for HA)
      replicas: {{ $inst.replicas | default 1 }}

      # -- PVC storage size request for each Galera member
      storageRequest: {{ $inst.storageRequest | default "500M" | quote }}

      # -- StorageClass override (empty falls back to global storageClass)
      storageClass: {{ $inst.storageClass | default "" | quote }}

      {{- if $inst.secret }}
      # -- Secret containing the database root password
      secret: {{ $inst.secret | quote }}
      {{- end }}

      {{- with $inst.containerImage }}
      # -- Container image override
      containerImage: {{ . | quote }}
      {{- end }}

      {{- with $inst.resources }}
      # -- Resource requests/limits for the Galera container
      resources:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with $inst.nodeSelector }}
      # -- Node selector override for this cluster
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with $inst.tls }}
      # -- TLS settings for intra-cluster communication
      tls:
        {{- toYaml . | nindent 8 }}
      {{- end }}


      {{- with $inst.extraSpec }}
      # -- Escape hatch: passthrough for unsupported CRD fields
      extraSpec:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $inst.topologyRef }}
      # -- Topology spread reference
      topologyRef:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end }}
