variable "aws_region" {
  type = string
  description = "AWS region where resources will be created"
  default     = "us-east-1"
}

variable "aws_region_aza" {
  type = string
  description = "Zonas de rede - AzA"
  default     = "us-east-1a"
}

variable "cidr_block_vpc" {
  type = string
  description = "IP da VPC"
  default     = "10.0.0.0/16"
}


variable "cidr_block_vpc_subnet_public" {
  type = string
  description = "IP da subnet publica"
  default     = "10.0.1.0/24"
}

variable "cidr_block_vpc_subnet_private" {
  type = string
  description = "IP da subnet privada"
  default     = "10.0.2.0/24"
}