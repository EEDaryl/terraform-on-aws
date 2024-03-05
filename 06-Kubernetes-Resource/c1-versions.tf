#   Terraform Block
terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
      source  = "hasicorp/aws"
      version = ">=5.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.0.0"
    }
  }
}