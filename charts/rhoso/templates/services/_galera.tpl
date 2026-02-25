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
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
