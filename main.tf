resource "aws_s3_bucket" "example" {
  bucket = "rhoribe-test-bucket"

  tags = {
    Name        = "rhoribe-test-bucket"
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
