#!/bin/bash
terraform plan -auto-approve
terraform apply -auto-approve
terraform destroy -auto-approve

# config ~/.kube/config
gcloud container clusters get-credentials interview-autopilot-cluster --region asia-southeast1 --project hopeisapp

# Retrieve argocd password
ENCRYPTED_PASSWORD=$(kubectl get secret/argocd-initial-admin-secret -o yaml -n argocd | yq .data.password)
echo "$ENCRYPTED_PASSWORD" | base64 -d; echo

kubectl port-forward svc/argocd-server -n argocd 8080:443