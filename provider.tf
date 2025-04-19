provider "aws" {
  region     = "ap-south-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

terraform {
  backend "s3" {
    bucket = "terraform-state-cicd-project"
    key    = "infrastructure/terraform.tfstate"
    region = "ap-south-1"
  }
}

