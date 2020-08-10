# -----------------------------------------------------------------------------
# Outputs: TF-MOD-AWS-APPSYNC-DATASOURCE 
# -----------------------------------------------------------------------------

output "arn" {
  value       = aws_appsync_datasource.default.*.arn
  description = "The ARN of the datasource"
}


