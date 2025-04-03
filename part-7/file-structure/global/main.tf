terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  # See /code/part-3/aws-backend
  backend "s3" {
    bucket         = "terraform-intermidate-state"
    key            = "part-7/global/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
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

# Route53 zone is shared across staging and production
resource "aws_route53_zone" "primary" {
  name = "devopsdeployed.com"
}
