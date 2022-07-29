#!/bin/sh

# Get YAML configuration for all of a specific resource type in current k8s context + namespace
fetch_config_for_resource() {
  for o in $(kubectl get $1 | grep -v NAME | awk '{print $1}'); do
    echo "---"
    kubectl get $1 $o -o yaml
  done
}

# Print in-use NodePorts in current k8s context + namespace
list_used_nodeports() {
  kubectl get svc -o go-template='{{range .items}}{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}{{end}}'
}
