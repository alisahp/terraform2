provider "aws" {
  region = "us-east-1"

  tags = { 
    Name        = "My bucket" 
    Environment = "Dev" 
  } 
}