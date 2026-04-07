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

# To create the S3 backend resources, run:
# aws s3 mb s3://your-terraform-state-bucket --region eu-central-1
# aws s3api put-bucket-versioning --bucket your-terraform-state-bucket --versioning-configuration Status=Enabled
# aws s3api put-bucket-encryption --bucket your-terraform-state-bucket --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'
# aws dynamodb create-table --table-name terraform-state-lock --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --billing-mode PAY_PER_REQUEST --region eu-central-1
