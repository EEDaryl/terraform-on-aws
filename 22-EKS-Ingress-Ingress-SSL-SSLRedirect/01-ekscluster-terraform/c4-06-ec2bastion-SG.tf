# Create Elastic IP for Bastion Host
# Resource - depends_on Meta-Argument
resource "aws_eip" "bastion_eip" {
  depends_on = [module.ec2_instance, module.vpc]
  instance   = module.ec2_instance.id
  domain     = "vpc"
  tags       = local.common_tags
}