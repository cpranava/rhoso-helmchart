{{/*
Horizon section for OpenStackControlPlane.
Ref: HorizonSection → horizonv1.HorizonSpecCore
Note: disabled by default upstream.
Values file: values-horizon.yaml
*/}}
{{- define "rhoso.horizon" -}}
horizon:
  enabled: {{ .Values.horizon.enabled }}
  {{- with .Values.horizon.apiOverride }}
  apiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.horizon.template }}
  template:
    # -- Number of Horizon replicas (max 32)
    replicas: {{ .replicas | default 1 }}

    # -- Secret containing the Horizon SECRET_KEY (required by CRD)
    secret: {{ .secret | default "osp-secret" | quote }}

    # -- Memcached instance name (required by CRD)
    memcachedInstance: {{ .memcachedInstance | default "memcached" | quote }}

    {{- with .customServiceConfig }}
    # -- Custom Python config snippets added to local_settings.d/9999_custom_settings.py
    customServiceConfig: {{ . | quote }}
    {{- end }}

    {{- with .defaultConfigOverwrite }}
    # -- Override specific config files (e.g. local_settings.py)
    defaultConfigOverwrite:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .networkAttachments }}
    # -- Additional Multus network attachments
    networkAttachments:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .resources }}
    # -- Resource requests/limits for the Horizon container
    resources:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for Horizon pods
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- if .preserveJobs }}
    # -- Do not delete completed jobs (useful for debugging)
    preserveJobs: {{ .preserveJobs }}
    {{- end }}

    {{- with .tls }}
    # -- TLS settings for Horizon
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
{{- end }}
