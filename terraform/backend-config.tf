terraform {
  # Remote State Configuration
  # Uncomment this block and update bucket name to enable S3 backend with state locking
  # 
  # Steps to set up:
  # 1. Create S3 bucket: aws s3 mb s3://your-org-terraform-state --region eu-central-1
  # 2. Enable versioning:
  #    aws s3api put-bucket-versioning --bucket your-org-terraform-state \
  #      --versioning-configuration Status=Enabled
  # 3. Enable encryption:
  #    aws s3api put-bucket-encryption --bucket your-org-terraform-state \
  #      --server-side-encryption-configuration '{
  #        "Rules":[{
  #          "ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}
  #        }]
  #      }'
  # 4. Block public access:
  #    aws s3api put-public-access-block --bucket your-org-terraform-state \
  #      --public-access-block-configuration \
  #      "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"
  # 5. Create DynamoDB table:
  #    aws dynamodb create-table --table-name terraform-state-lock \
  #      --attribute-definitions AttributeName=LockID,AttributeType=S \
  #      --key-schema AttributeName=LockID,KeyType=HASH \
  #      --billing-mode PAY_PER_REQUEST --region eu-central-1
  #
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
