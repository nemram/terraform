provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "nemramos"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
