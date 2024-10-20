resource "aws_subnet" "eua" {
  vpc_id     = module.vpc.vpc_id_default
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-terraform-provider"
  }
}

resource "aws_subnet" "brasil" {
  provider   = aws.brasil
  vpc_id     = module.vpc.vpc_id_provider_1
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-terraform-provider"
  }
}

resource "aws_subnet" "europa" {
  provider   = aws.europa
  vpc_id     = module.vpc.vpc_id_provider_2
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-terraform-provider"
  }
}