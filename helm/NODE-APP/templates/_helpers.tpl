{{/*
Create a default fully qualified app name.
*/}}
{{- define "nodejs-app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "nodejs-app.labels" -}}
helm.sh/chart: {{ include "nodejs-app.chart" . }}
{{ include "nodejs-app.selectorLabels" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "nodejs-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nodejs-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Returns the name of the chart
*/}}
{{- define "nodejs-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Returns the chart name with a version
*/}}
{{- define "nodejs-app.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}
