terraform {
  backend "s3" {
    bucket         = "terraform-eks-1925"
    region         = "us-east-1"
    key            = "EKS-DevSecOps-Reddit-Project/EKS-TF/terraform.tfstate"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
