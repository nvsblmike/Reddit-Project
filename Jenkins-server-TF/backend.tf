terraform {
  backend "s3" {
    bucket         = "terraform-eks-1925"
    region         = "us-east-1"
    key            = "End-to-End-Kubernetes-DevSecOps-Tetris-Project/Jenkins-Server-TF/terraform.tfstate"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
