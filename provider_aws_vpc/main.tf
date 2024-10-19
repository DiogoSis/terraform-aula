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
    key    = "provider/terraform.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {
  alias  = "brasil"
  region = "sa-east-1"
  default_tags {
    tags = local.common_tags
  }
}

provider "aws" {
  alias  = "europa"
  region = "eu-central-1"
  default_tags {
    tags = local.common_tags
  }
}

module "vpc" {
  providers = {
    aws.provider_1 = aws.brasil
    aws.provider_2 = aws.europa
  }
  source = "./vpc"
}