**Candidate Assignment Instructions:**

The sample application is developed using Go. Our development team would like to deliver this application to Production. As a DevOps engineer, you are responsible to complete the tasks by following these key areas: High Availability, Scalability, Security.

**Task:**

1. Create a Dockerfile for a given application

**Expected Output:** Dockerfile

2. Build the image using the Dockerfile and push to Docker Hub

**Expected Output:** Build and push command and Docker Hub url

3. Create a Kustomize manifest to deploy the image from the previous step. The Kustomize should have flexibility to allow Developer to adjust values without having to rebuild the Kustomize frequently

**Expected Output:** Kustomize manifest file to deploy the application

4. Setup GKE cluster with the related resources to run GKE like VPC, Subnets, etc. by following GKE Best Practices using any IaC tools (Terraform, OpenTufo, Pulumi) (Bonus point: use Terraform/Terragrunt)

**Expected Output:** IaC code

* Condition: Avoid injecting the generated GCP access keys to the application directly.

**Expected Output:** Kustomize manifest, IaC code or anything to complete this task.

5. Use ArgoCD to deploy this application. To follow GitOps practices, we prefer to have an ArgoCD application defined declaratively in a YAML file if possible.

**Expected output:** Yaml files and instruction how to deploy the application or command line

6. Create CICD workflow using GitOps pipeline to build and deploy application

**Expected output:** GitOps pipeline (Github, Gitlab, Bitbucket, Jenkins) workflow or diagram

## CheckPoint
- [x] Dockerfile
- [x] Kustomize Manifest
- [x] GKE cluster with IaC
- [x] ArgoCD
- [x] CI/CD

## How to

1. Create GKE cluster with terraform
   ```bash
   make plan-gke
   make apply-gke
   ```

2. Config `.kube`
    ```bash
    gcloud container clusters get-credentials $CLUSTER_NAME --region $REGION --project $PROJECT_ID
    ```

3. Create ArgoCD service with terraform
   ```bash
   make plan-argocd
   make apply-argocd
   ```

4. Retrieve ArgoCD admin password
    ```bash
    ENCRYPTED_PASSWORD=$(kubectl get secret/argocd-initial-admin-secret -o yaml -n argocd | yq .data.password)
    echo "$ENCRYPTED_PASSWORD" | base64 -d; echo
    ```

5. Run ArgoCD forword port from local
    ```bash
    kubectl port-forward svc/argocd-server -n argocd 8080:443
    ```

## Example Output
Example app run on tempary ip address
\* IP maybe change 
```bash
http://35.247.186.158/
```
