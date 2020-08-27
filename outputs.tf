# -----------------------------------------------------------------------------
# Outputs: TF-MOD-AWS-APPSYNC-DATASOURCE 
# -----------------------------------------------------------------------------


output "dynamodb" {
  value       = { for d in aws_appsync_datasource.dynamodb : d.name => { "name" = d.name, "arn" = d.arn } }
  description = "The ARN && Name of the dynamodb datasources"
}

output "elasticsearch" {
  value       = { for d in aws_appsync_datasource.elasticsearch : d.name => { "name" = d.name, "arn" = d.arn } }
  description = "The ARN && Name of the elasticsearch datasources"
}

output "http" {
  value       = { for d in aws_appsync_datasource.http : d.name => { "name" = d.name, "arn" = d.arn } }
  description = "The ARN && Name of the datasource"
}

output "lambda" {
  value       = { for d in aws_appsync_datasource.lambda : d.name => { "name" = d.name, "arn" = d.arn } }
  description = "The ARN && Name of the datasource"
}

output "empty" {
  value       = { for d in aws_appsync_datasource.empty : d.name => { "name" = d.name, "arn" = d.arn } }
  description = "The ARN && Name of the datasource"
}



