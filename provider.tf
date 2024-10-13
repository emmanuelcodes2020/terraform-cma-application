terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "global-cma-application"
    key = "global/cma/dev/terraform.tfstate"
    region = "eu-west-2"
   
    
  }
}



provider "aws" {
  region = "eu-west-2"
  default_tags {
    tags = {
      BillingID = "CMA-Team"
      Project   = "CMA"
      terraform = true
    }
  }
}