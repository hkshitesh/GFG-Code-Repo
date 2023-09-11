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
    access_key = "AKIA4ERPRUEUUBSQWAHB"
    secret_key = "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"  
}