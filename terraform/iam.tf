# ECR Pull Policy for node instances
resource "aws_iam_policy" "ecr_pull_policy" {
  name        = "${local.name_prefix}-ecr-pull"
  description = "Policy for EKS nodes to pull images from ECR"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # This action allows getting the login password. 
        # It DOES NOT support resource-level permissions.
        Effect   = "Allow"
        Action   = "ecr:GetAuthorizationToken"
        Resource = "*"
      },
      {
        # These actions are scoped specifically to your account's repositories.
        Effect = "Allow"
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]
        Resource = "arn:aws:ecr:${var.aws_region}:${data.aws_caller_identity.current.account_id}:repository/*"
      }
    ]
  })

  tags = local.common_tags
}

# Attach ECR policy to node IAM role
# Note: This policy is attached through eks_managed_node_groups
# in terraform/eks.tf via iam_role_additional_policies.


# IRSA - ECR Secret Refresh 


module "ecr_secret_refresher_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.0"

  role_name_prefix = "${local.iam_name_prefix}-ecr-refresh-"

  role_policy_arns = {
    ecr = aws_iam_policy.ecr_pull_policy.arn
  }

  oidc_providers = {
    main = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:ecr-credential-provider"] # Changed from 'default' to 'kube-system' as a best practice
    }
  }

  tags = local.common_tags
}

data "aws_caller_identity" "current" {}