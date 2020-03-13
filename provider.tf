provider "aws" {
  region  = "us-east-1"
}

terraform {
  required_version = "~> 0.11.14"
  required_providers = "2.51"
}