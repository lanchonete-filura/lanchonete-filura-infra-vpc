# Definição do provedor AWS
provider "aws" {
  region = var.aws_region
}

# Criação da VPC
resource "aws_vpc" "lanchonete_vpc" {
  cidr_block           = var.cidr_block_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    Name = "lanchonete-filura"
  }
}

# Criação de uma subnet pública
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.lanchonete_vpc.id
  cidr_block        = var.cidr_block_vpc_subnet_public
  availability_zone = var.aws_region_aza
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}

# Criação de uma subnet privada
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.lanchonete_vpc.id
  cidr_block        = var.cidr_block_vpc_subnet_private
  availability_zone = var.aws_region_aza

  tags = {
    Name = "Private Subnet"
  }
}
