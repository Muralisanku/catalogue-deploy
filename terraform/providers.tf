terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.88.0"
    }
  }

  backend "s3" {
    bucket = "joinaiops-state-dev"
    key    = "catalogue"
    region = "us-east-1"
    dynamodb_table = "joinaiops-locking-dev"
  }
}

provider "aws" {
  region = "us-east-1"
}