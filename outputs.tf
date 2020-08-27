# -----------------------------------------------------------------------------
# Outputs: TF-MOD-AWS-APPSYNC-DATASOURCE 
# -----------------------------------------------------------------------------

output "dynamodb" {
  value       = { for d in var.dynamodb_config : d.name => merge(d, { d.name = d.arn }
  description = "The ARN of the datasource"
}


