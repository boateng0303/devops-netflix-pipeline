# Root Module - main.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region = var.region
}

# Data sources
data "aws_availability_zones" "available" {
  state = "available"
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  cluster_name = var.cluster_name
  vpc_cidr     = var.vpc_cidr
  azs          = slice(data.aws_availability_zones.available.names, 0, 2)
}

# EKS Module
module "eks" {
  source = "./modules/eks"

  cluster_name         = var.cluster_name
  kubernetes_version   = var.kubernetes_version
  subnet_ids          = concat(module.vpc.private_subnet_ids, module.vpc.public_subnet_ids)
  node_subnet_ids     = module.vpc.private_subnet_ids
  node_instance_types = var.node_instance_types
  node_scaling_config = var.node_scaling_config
}


#ECR Module
module "netflix_ecr" {
  source               = "./modules/ecr"
  name                 = "netflix-app"
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true
  tags = {
    Environment = "dev"
    Project     = "Netflix"
  }
}