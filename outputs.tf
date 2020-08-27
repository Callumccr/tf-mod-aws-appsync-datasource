# -----------------------------------------------------------------------------
# Outputs: TF-MOD-AWS-APPSYNC-DATASOURCE 
# -----------------------------------------------------------------------------

# output "dynamodb" {
#   value       = { for d in var.dynamodb_config : d.name => merge(d, { for d in aws_appsync_datasource.dynamodb : "arn" => d.arn[lookup(var.dynamodb_config, "name", "")] }) }
#   description = "The ARN of the datasource"
# }

output "dynamodb" {
  value       = { for d in aws_appsync_datasource.dynamodb : d.name => { "name" = d.name } }
  description = "The ARN of the datasource"
}



