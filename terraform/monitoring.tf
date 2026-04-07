# CloudWatch Log Group for Application Logs (optional, for future use)
resource "aws_cloudwatch_log_group" "application_logs" {
  name              = "/aws/eks/${var.cluster_name}/applications"
  retention_in_days = var.log_retention_days

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-app-logs"
    }
  )
}

# CloudWatch Alarms for EKS Cluster Health
# Note: CPU alarm requires Auto Scaling Group name which is not directly exposed by the module
# Memory alarm requires CloudWatch Agent installation on nodes
# These are left here as examples for future implementation

# Example CPU Alarm (commented - requires ASG name from EC2):
# resource "aws_cloudwatch_metric_alarm" "eks_node_cpu" {
#   alarm_name          = "${local.name_prefix}-high-cpu"
#   comparison_operator = "GreaterThanThreshold"
#   evaluation_periods  = "2"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = "300"
#   statistic           = "Average"
#   threshold           = "80"
#   alarm_description   = "Alert when node CPU exceeds 80%"
#   treat_missing_data  = "notBreaching"
#   tags = local.common_tags
# }

# Example Memory Alarm (commented - requires CloudWatch Agent):
# resource "aws_cloudwatch_metric_alarm" "eks_node_memory" {
#   alarm_name          = "${local.name_prefix}-high-memory"
#   comparison_operator = "GreaterThanThreshold"
#   evaluation_periods  = "2"
#   metric_name         = "MemoryUtilization"
#   namespace           = "CWAgent"
#   period              = "300"
#   statistic           = "Average"
#   threshold           = "85"
#   alarm_description   = "Alert when node memory exceeds 85%"
#   treat_missing_data  = "notBreaching"
#   tags = local.common_tags
# }
