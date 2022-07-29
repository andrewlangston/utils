#!/bin/sh

# Delete pending jobs in current k8s context + namespace
delete_pending_jobs() {
  for d in $(kubectl get jobs | grep "0/1" | awk '{print $1}'); do
    kubectl delete job/$d
  done
}

# Delete pending jobs in current k8s context + namespace that a specified pattern
delete_pending_jobs_for() {
  for d in $(kubectl get jobs | grep "0/1" | grep "$1" | awk '{print $1}'); do
    kubectl delete job/$d
  done
}
