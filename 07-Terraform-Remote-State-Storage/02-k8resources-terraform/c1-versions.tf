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
  backend "s3" {
    bucket = "terraform-aws-eks2024"
    key = "dev/app1k8s/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "dev-k8resources"
  }
}