provider "aws" {
  region  = "us-east-1"
  profile = "default"
  version = "~> 4.0"
  default_tags {
    tags = {
      map-migrated = "d-server-028bqm2pgp95c2"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "axle-infra"
    key    = "terraform_state/legacy_importer/terraform.tfstate"
    region = "us-east-1"
  }
}
