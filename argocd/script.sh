#!/bin/bash
terraform plan -auto-approve
terraform apply -auto-approve
terraform destroy -auto-approve

# config ~/.kube/config
gcloud container clusters get-credentials interview-autopilot-cluster --region asia-southeast1 --project hopeisapp 

# Retrieve argocd password
kubectl get secret/argocd-initial-admin-secret -o yaml -n argocd
