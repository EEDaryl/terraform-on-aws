# Reosurce: AWS IAM Group
resource "aws_iam_group" "eks_admin_iam_group" {
  name = "${local.name}-eksadmin"
  path = "/"
}

# Resource: AWS IAM Group Policy
resource "aws_iam_group_policy" "eksadmin_iam_group_assumerole_policy" {
  name = "${local.name}-eksadmins-group-policy"
  group = aws_iam_group.eks_admin_iam_group.name

  # Terraform expression result to valid JSON Syntax
  policy = jsondecode({
    Version = "2012-10-17"
    Statement = [
        {
            Action = [
                "sts:AssumeRole",
            ]
            Effect = "Allow"
            Sid = "AllowAssumeOrganizationAccountRole"
            Reosurce = "${aws_iam_role.eks_admin_role.arn}"
        },
    ]
  })
}

# Resource: AWS IAM User - Basic User (No AWS Console Access)
resource "aws_iam_user" "eksadmin_user" {
  name = "${local.name}-eksadmin3"
  path = "/"
  force_destroy = true
  tags = local.common_tags
}

# Resource: AWS IAM Group Memebership
resource "aws_iam_group_membership" "eksadmins" {
  name = "${local.name}-eksadmins-group-membership"
  users = [ 
    aws_iam_user.eksadmin_user.name
   ]
   group = aws_iam_group.eks_admin_iam_group.name
}