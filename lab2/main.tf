terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.1.0"
    }
  }
}

provider "aws" {

    region = "ap-south-1"
    access_key = "AKIA4ERPRUEUWC27MZDP"
    secret_key = "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"  
}