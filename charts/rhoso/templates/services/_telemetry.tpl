{{/*
Telemetry section for OpenStackControlPlane.
Ref: TelemetrySection → telemetryv1.TelemetrySpecCore
Note: Has multiple API overrides for each sub-service:
  - aodhApiOverride      (Aodh - Alarm service)
  - cloudKittyApiOverride (CloudKitty - Rating service)
  - prometheusOverride
  - alertmanagerOverride
  ApplicationCredentials are per-sub-service (Ceilometer, Aodh, CloudKitty).
Values file: values-telemetry.yaml
*/}}
{{- define "rhoso.telemetry" -}}
telemetry:
  enabled: {{ .Values.telemetry.enabled }}
  {{- with .Values.telemetry.aodhApiOverride }}
  aodhApiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.telemetry.cloudKittyApiOverride }}
  cloudKittyApiOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.telemetry.prometheusOverride }}
  prometheusOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.telemetry.alertmanagerOverride }}
  alertmanagerOverride:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.telemetry.template }}
  template:
    {{- with .ceilometer }}
    # -- Ceilometer metering service (enabled by default)
    # Explicit: enabled, secret. Rest toYaml (resources, networkAttachments vary)
    ceilometer:
      enabled: {{ .enabled }}
      {{- with .secret }}
      # -- Secret containing OpenStack passwords (required by CRD)
      secret: {{ . | quote }}
      {{- end }}
      {{- with .customServiceConfig }}
      # -- Custom oslo.config snippets
      customServiceConfig: {{ . | quote }}
      {{- end }}
      {{- with .networkAttachments }}
      # -- Additional Multus network attachments
      networkAttachments:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .resources }}
      # -- Resource requests/limits
      resources:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}

    {{- with .autoscaling }}
    # -- Autoscaling (Aodh) sub-service (toYaml — alarm config varies heavily)
    autoscaling:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .metricStorage }}
    # -- MetricStorage (Prometheus/Alertmanager) sub-service (toYaml — storage config varies)
    metricStorage:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .logging }}
    # -- Logging (Loki/Vector) sub-service (toYaml — storage config varies)
    logging:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .cloudkitty }}
    # -- CloudKitty rating sub-service (toYaml — rating backends vary)
    cloudkitty:
      {{- toYaml . | nindent 6 }}
    {{- end }}

    {{- with .nodeSelector }}
    # -- Node selector for all Telemetry pods
    nodeSelector:
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
  {{- with .Values.telemetry.applicationCredentialCeilometer }}
  applicationCredentialCeilometer:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.telemetry.applicationCredentialAodh }}
  applicationCredentialAodh:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.telemetry.applicationCredentialCloudKitty }}
  applicationCredentialCloudKitty:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
