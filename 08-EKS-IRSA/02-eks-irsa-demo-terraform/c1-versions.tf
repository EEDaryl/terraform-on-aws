terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0.0"
    }
  }
  backend "s3" {
    bucket = "terraform-aws-eks2024"
    key    = "dev/eks-irsa-demo/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "dev-eks-irsa-demo" #For state locking
  }
}