# -----------------------------------------------------------------------------
# Outputs: TF-MOD-AWS-APPSYNC-DATASOURCE 
# -----------------------------------------------------------------------------


output "dynamodb" {
  value       = { for d in aws_appsync_datasource.dynamodb : d.name => { "name" = d.name, "arn" = d.arn } }
  description = "The ARN of the datasource"
}



