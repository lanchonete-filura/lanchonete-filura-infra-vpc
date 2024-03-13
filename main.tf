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
resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.lanchonete_vpc.id
  cidr_block        = var.cidr_block_vpc_subnet_private_a
  availability_zone = var.aws_region_aza

  tags = {
    Name = "Private Subnet A"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = aws_vpc.lanchonete_vpc.id
  cidr_block        = var.cidr_block_vpc_subnet_private_b
  availability_zone = var.aws_region_azb

  tags = {
    Name = "Private Subnet A"
  }
}

# Criação de um Security Group
resource "aws_security_group" "internal_sg" {
  name        = "internal-sg"
  description = "Security group for internal communication within the VPC"
  vpc_id      = aws_vpc.lanchonete_vpc.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # A VPC CIDR
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # A VPC CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Internal SG"
  }
}