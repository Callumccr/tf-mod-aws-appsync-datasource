resource "aws_appsync_datasource" "default" {
  count            = var.enabled ? 1 : 0
  api_id           = var.api_id
  name             = var.name
  type             = var.type
  description      = var.description
  service_role_arn = var.service_role_arn != "" ? var.service_role_arn : 0


  elasticsearch_config {
    endpoint = var.type == "AMAZON_ELASTICSEARCH" ? lookup(var.elasticsearch_config, "endpoint", "") : ""
    region   = var.type == "AMAZON_ELASTICSEARCH" ? lookup(var.elasticsearch_config, "region", "") : ""
  }

  http_config {
    endpoint = var.type == "HTTP" ? lookup(var.http_config, "endpoint", "") : ""
  }

  dynamodb_config {
    table_name             = var.type == "AMAZON_DYNAMODB" ? lookup(var.dynamodb_config, "table_name", "") : ""
    region                 = var.type == "AMAZON_DYNAMODB" ? lookup(var.dynamodb_config, "region", "") : ""
    use_caller_credentials = var.type == "AMAZON_DYNAMODB" ? lookup(var.dynamodb_config, "use_caller_credentials", "") : ""
  }

  lambda_config {
    function_arn = var.type == "AWS_LAMBDA" ? lookup(var.elasticsearch_config, "function_arn", "") : ""
  }

}
