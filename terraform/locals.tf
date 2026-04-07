// this file defines local values that are used across multiple Terraform modules for consistency and maintainability
locals {
  # Common naming convention
  name_prefix = "${var.cluster_name}-${var.environment}"

  # IAM role name prefix (limited to 38 chars max for name_prefix parameter)
  iam_name_prefix = var.cluster_name

  # Availability zones
  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  # Common tags applied to all resources
  common_tags = merge(
    var.tags,
    {
      Environment = var.environment
      Cluster     = var.cluster_name
      ManagedBy   = "Terraform"
      CreatedAt   = timestamp()
    }
  )

  # EKS logging configuration
  eks_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  # ECR repository names
  ecr_repository_names = var.ecr_repositories

  # Node group naming (keep very short for IAM role name_prefix compatibility - max ~20 chars)
  node_group_name = "main"
}
