variable "vpc-name" {}
variable "igw-name" {}
variable "rt-name2" {}
variable "subnet-name" {}
variable "subnet-name2" {}
variable "security-group-name" {}
variable "iam-role-eks" {}
variable "iam-role-node" {}
variable "iam-policy-eks" {}
variable "iam-policy-node" {}
variable "cluster-name" {}
variable "eksnode-group-name" {}
variable "environment" {
  description = "Deployment environment"
  default     = "prod"
}
variable "aws_region" {}