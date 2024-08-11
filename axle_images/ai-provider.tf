terraform {
  required_version = "~> 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "axle-infra"
    key    = "terraform_state/axle_images/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = var.region
  profile = "default"
  default_tags {
    tags = {
      map-migrated = "d-server-028bqm2pgp95c2"
    }
  }
}

