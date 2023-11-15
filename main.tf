resource "aws_s3_bucket" "example" {
  bucket = "rhoribe-test-bucket"

  tags = {
    Name        = "rhoribe-test-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "example1" {
  bucket = "rhoribe-test-bucket1"

  tags = {
    Name        = "rhoribe-test-bucket1"
    Environment = "Dev"
  }
}


terraform {
  backend "s3" {
    bucket         = var.bucket
    key            = var.key
    region         = var.region
    encrypt        = true
  }
}
