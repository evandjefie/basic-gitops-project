#!/bin/bash

# echo "(1): Install minikube"
sudo apt install -y curl wget apt-transport-https
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube version
sleep 3

# echo "(2): Launch minikube on docker"
minikube start driver=docker
minikube status
sleep 3

# kubectl
echo "(3): Install KUBECTL"
curl -LO https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
sleep 3

# helm
echo "(4): Install HELM"
mkdir helm && cd helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm version
cd
sleep 3

# echo "(5): Deploy PROMETHEUS & GRAFANA on minikube"
# kubectl create namespace monitoring
# helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm repo update
# helm install monitoring prometheus-community/kube-prometheus-stack --namespace monitoring
# sleep 3

echo "(6): Deploy ARGOCD on minikube"
kubectl create namespace argocd
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argocd argo/argo-cd --namespace argocd
sleep 3

echo "WELL DONE (-_-) at k8s vm!"