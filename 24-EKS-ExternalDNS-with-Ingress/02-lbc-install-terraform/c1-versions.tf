terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">=2.6"
    }
    http = {
      source = "hashicorp/http"
      version = ">=2.2"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">=2.12"
    }
  }
  backend "s3" {
    bucket = "terraform-aws-eks2024"
    key    = "dev/eks-lbc/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "dev-aws-lbc" #For state locking
  }
}

# Terraform AWS Provider Block
provider "aws" {
  profile = "default"
  region  = var.aws_region
}

# Terraform HTTP Provider Block
provider "http" {
  # Configuration
}