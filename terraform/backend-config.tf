terraform {
  # backend "s3" {
  #   bucket         = "your-org-terraform-state"
  #   key            = "microservices/${var.environment}/terraform.tfstate"
  #   region         = "eu-central-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-state-lock"
  #
  #   # Prevent accidental state deletion
  #   skip_credentials_validation = false
  #   skip_metadata_api_check     = false
  # }
}
