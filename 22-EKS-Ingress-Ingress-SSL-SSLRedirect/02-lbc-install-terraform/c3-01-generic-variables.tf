# Input Variables - Placeholder File
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources are to be created"
  type = string
  default = "us-east-1"
}

# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "dev"
}

#Business Division
variable "business_division" {
  description = "Business Division in the large organization this infrastructure belongs"
  type = string
  default = "SAP"
}