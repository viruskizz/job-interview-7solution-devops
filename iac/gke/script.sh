#!/bin/bash
export TF_VAR_project_id=
terraform plan -auto-approve
terraform apply -auto-approve
terraform destroy -auto-approve