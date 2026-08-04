{{/*
Базовое имя ресурсов — берём имя релиза (уникально для каждой установки чарта:
helm install app1-v1 ..., helm install app1-v2 ..., helm install app2-v1 ...).
Благодаря этому несколько релизов чарта не конфликтуют по именам ресурсов
даже в одном namespace (Задание 2).
*/}}
{{- define "myapp.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Общие лейблы.
Используются на всех ресурсах чарта.
*/}}
{{- define "myapp.labels" -}}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}
