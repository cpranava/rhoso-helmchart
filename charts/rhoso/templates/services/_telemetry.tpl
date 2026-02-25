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
  {{- with .Values.telemetry.template }}
  template:
    {{- toYaml . | nindent 4 }}
  {{- end }}
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
