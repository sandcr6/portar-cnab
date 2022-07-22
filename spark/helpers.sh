#!/usr/bin/env bash
set -euo pipefail

install() {
  echo Hello World
}

upgrade() {
  echo World 2.0
}

uninstall() {
  echo Goodbye World
}

addRepo() {
  echo Adding the repo
  helm3 repo add mlops-helm-charts https://hcss.jfrog.io/artifactory/api/helm/mlops-helm-charts --username $1  --password $2
}

clean-up(){
  echo "Clean resources if exist"
  kubectl delete sa spark-operator --kubeconfig=$1 -n$2
  kubectl delete clusterrole spark-operator --kubeconfig=$1
  kubectl delete clusterrolebinding spark-operator --kubeconfig=$1
}

# Call the requested function and pass the arguments as-is
"$@"
