// this file defines local values that are used across multiple Terraform modules for consistency and maintainability
locals {
  # Common naming convention
  name_prefix = "${var.cluster_name}-${var.environment}"


  iam_name_prefix = var.cluster_name

  # Availability zones
  azs = slice(data.aws_availability_zones.available.names, 0, 3)


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


  node_group_name = "main"
}
