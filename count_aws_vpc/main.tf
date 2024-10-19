terraform {
  required_version = ">= 1.3.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }
  }

  backend "s3" {
    bucket = "aula-terraform-aws-azure"
    key    = "count/terraform.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = local.common_tags
  }
}