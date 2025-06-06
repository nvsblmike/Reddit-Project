variable "vpc-name" {}
variable "igw-name" {}
variable "rt-name" {}
variable "subnet-name" {}
variable "sg-name" {}
variable "instance-name" {}
variable "key-name" {}
variable "iam-role" {}
variable "aws_region" {}
variable "environment" {
  description = "Deployment environment"
  default     = "prod"
}
