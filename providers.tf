# Terraform Setting
terraform {
  required_version = ">= 0.14"

  required_providers {
    aws = {
      version = ">= 3.37.0"
    }
  }

  # ---------- Terraform Remote Backend（Store Remote State） ----------
  # aws S3 bucket Name and Region for Terraform
  backend "s3" {
    # [TODO] 自身の環境にあわせて変更
    bucket = "jbgr-jedi-2-terraform-backend"
    key    = "jedi-5th-infra-ec2-win"
    region = "ap-northeast-1"
  }
  # --------------------------------------------------------------------
}

# Provider Setting
provider "aws" {
  region = var.region
}
