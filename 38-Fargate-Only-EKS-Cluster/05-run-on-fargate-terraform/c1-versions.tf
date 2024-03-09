terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=5.40"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">=2.26"
    }
  }
}