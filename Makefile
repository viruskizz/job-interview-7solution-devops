NAME=7solution
TAG=devops

$(NAME): all

all: build run

build:
	docker build -t ${NAME}:${TAG} .

run:
	docker run --rm -p 8080:8080 ${NAME}:${TAG}

plan-gke:
	cd iac/gke && terraform plan

apply-gke:
	cd iac/gke && terraform apply

plan-argocd:
	cd iac/argocd && terraform plan

apply-argocd:
	cd iac/argocd && terraform apply

.phony: build run