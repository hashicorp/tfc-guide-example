resource "aws_s3_bucket" "acme" {
  bucket = "acme-test-bucket-xyz789123"

  tags = {
    Name        = "Acme Test Bucket"
    Environment = "Dev"
  }
}
