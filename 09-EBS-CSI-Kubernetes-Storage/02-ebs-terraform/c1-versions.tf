terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-aws-eks2024"
    key = "dev/ebs-storage/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "dev-ebs-storage" #For state locking
  }
}

provider "aws" {
  region  = var.aws_region
}
