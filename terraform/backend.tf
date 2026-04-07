# Uncomment and configure for remote state storage
# terraform {
#   backend "s3" {
#     bucket         = "your-terraform-state-bucket"
#     key            = "microservices/terraform.tfstate"
#     region         = "eu-central-1"
#     encrypt        = true
#     dynamodb_table = "terraform-state-lock"
#   }
# }
