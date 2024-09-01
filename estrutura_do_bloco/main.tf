terraform {
  required_version = "≳ 1.0.0" #1.0.0 até 1.0.n

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.49.0"
    }
  }

  backend "s3" {
    
  }
}