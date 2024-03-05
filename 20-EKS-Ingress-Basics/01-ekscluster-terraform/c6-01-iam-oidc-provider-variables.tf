# EKS OIDC ROOT CA Thumbprint - Valid until 2037
/*
variable "eks_oidc_root_ca_thumbprint" {
  type        = string
  description = "Thumbprint of ROOT CA for EKS OIDC, Valid until 2037"
  default     = ""
}
*/
### External cli kubergrunt
data "external" "thumb" {
  program = ["kubergrunt", "eks", "oidc-thumbprint", "--issuer-url", aws_eks_cluster.eks_cluster.identity.0.oidc.0.issuer]
}           
