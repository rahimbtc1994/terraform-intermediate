terraform {
  backend "remote" {
    organization = "rahimbtc1994-org"

    workspaces {
      name = "terraform-intermidate"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}