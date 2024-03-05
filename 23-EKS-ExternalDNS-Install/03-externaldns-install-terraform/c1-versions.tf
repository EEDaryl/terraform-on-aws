# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=5.37.0"
     }
    helm = {
      source = "hashicorp/helm"
      #version = "2.5.1"
      version = ">= 2.5"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">=2.12.1"
    }      
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-on-aws-eks"
    key    = "dev/aws-externaldns/terraform.tfstate"
    region = var.aws_region 

    # For State Locking
    dynamodb_table = "dev-aws-externaldns"    
  }     
}

# Terraform AWS Provider Block
provider "aws" {
  region = var.aws_region
}