resource "aws_s3_bucket" "dev-data-store-folder" {
  bucket = "dev-env-data-storage"

  tags = {
    Owner        = "Anitha"
    project = "Dev"
  }
}