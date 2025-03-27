terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.91.0"
    }
  }
  backend "s3" {
    bucket = "kadapadev-25"
    key    = "for-each-kadapa-1"
    region = "us-east-1"
   dynamodb_table = "kadapadev-25-terra"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}