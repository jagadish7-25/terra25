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
    use_lockfile = "kadapadev-25-terra"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}