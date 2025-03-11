terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.74.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }

  required_version = ">= 0.14"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  # credentials = var.gcp_credentials
  project     = var.project_id
  region      = var.region
}
