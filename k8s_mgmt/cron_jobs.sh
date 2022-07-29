#!/bin/sh

# Suspend all cronjobs in current k8s context + namespace
suspend_all_cronjobs() {
  for d in $(kubectl get cronjob | grep False | awk '{print $1}'); do
    kubectl patch cronjob/$d --patch '{"spec": {"suspend": true}}'
  done
}

# Suspend cronjobs in current k8s context + namespace that match a specified pattern
suspend_cronjobs_like() {
  for d in $(kubectl get cronjob | grep False | grep "$1" | awk '{print $1}'); do
    kubectl patch cronjob/$d --patch '{"spec": {"suspend": true}}'
  done
}

# Resume all cronjobs in current k8s context + namespace
resume_all_cronjobs() {
  for d in $(kubectl get cronjob | grep True | awk '{print $1}'); do
    kubectl patch cronjob/$d --patch '{"spec": {"suspend": false}}'
  done
}
