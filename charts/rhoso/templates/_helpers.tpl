{{/*
Expand the name of the chart.
*/}}
{{- define "rhoso.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Full name for the OpenStackControlPlane CR.
*/}}
{{- define "rhoso.controlplane.name" -}}
{{- if .Values.nameOverride }}
{{- .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- "controlplane" }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rhoso.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
app.kubernetes.io/name: {{ include "rhoso.name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end }}
