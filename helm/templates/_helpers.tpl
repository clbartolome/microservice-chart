{{- define "quarkus.name" -}}
{{ default .Release.Name .Values.global.nameOverride }}
{{- end -}}

{{- define "quarkus.labels" -}}
helm.sh/chart: {{ .Chart.Name }}:{{ .Chart.Version}}
{{ include "quarkus.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- if .Values.runtime }}
app.openshift.io/runtime: {{ .Values.runtime }}
{{- end }}
{{- end }}

{{- define "quarkus.selectorLabels" -}}
app: {{ include "quarkus.name" . }}
app.kubernetes.io/name: {{ include "quarkus.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "quarkus.imageName" -}}
{{ default (include "quarkus.name" .) .Values.image.name }}:{{ .Values.image.tag }}
{{- end -}}