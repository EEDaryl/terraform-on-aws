# Terraform Remote State DataSource
data "terraform_remote_state" "eks" {
  backend = "local"

  config = {
    path = "../06-Kuberenetes-Resources/terraform.tfstate"
  }
}
