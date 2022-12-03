#!/bin/bash
# Copyright 2022 Hewlett Packard Enterprise Development LP
set -euo pipefail

clean-up(){
  echo "Clean resources if exist"
  kubectl delete sa spark-operator --kubeconfig=$1 -n$2 --ignore-not-found=true
  kubectl delete clusterrole spark-operator --kubeconfig=$1 --ignore-not-found=true
  kubectl delete clusterrolebinding spark-operator --kubeconfig=$1 --ignore-not-found=true
}

# Call the requested function and pass the arguments as-is
"$@"
