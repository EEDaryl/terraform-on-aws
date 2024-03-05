data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "terraform-aws-eks2024"
    key = "dev/eks-cluster/terraform.tfstate"
    region = var.aws_region
  }
}