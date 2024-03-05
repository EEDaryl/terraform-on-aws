# Terraform Remote State DataSource
data "terraform_remote_state" "eks" {
  backend = "local"

  config = {
    path = "../07-Terraform-Remote-State-Storage/terraform.tfstate"
  }
}
