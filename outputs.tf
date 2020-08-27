# -----------------------------------------------------------------------------
# Outputs: TF-MOD-AWS-APPSYNC-DATASOURCE 
# -----------------------------------------------------------------------------

output "dynamodb" {
  value       = { for d in var.dynamodb_config : d.name => merge(d, { for d in aws_appsync_datasource.dynamodb : arn => d.arn ) }}
  description = "The ARN of the datasource"
}


