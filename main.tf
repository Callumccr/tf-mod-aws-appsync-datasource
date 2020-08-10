resource "aws_appsync_datasource" "default" {
  count            = var.enabled ? 1 : 0
  api_id           = var.api_id
  name             = var.name
  type             = var.type
  description      = var.description
  service_role_arn = list(var.service_role_arn) > 0 ? "" : var.service_role_arn

  dynamic "dynamodb_config" {
    for_each = var.type == "AMAZON_DYNAMODB" ? var.dynamodb_config : {}
    iterator = AMAZON_DYNAMODB
    content {
      table_name             = AMAZON_DYNAMODB.table_name.value
      region                 = AMAZON_DYNAMODB.region.value
      use_caller_credentials = AMAZON_DYNAMODB.use_caller_credentials.value
    }
  }

  dynamic "elasticsearch_config" {
    for_each = var.type == "AMAZON_ELASTICSEARCH" ? var.elasticsearch_config : {}
    iterator = AMAZON_ELASTICSEARCH
    content {
      endpoint = AMAZON_ELASTICSEARCH.endpoint.value
      region   = AMAZON_ELASTICSEARCH.region.region
    }
  }

  dynamic "http_config" {
    for_each = var.type == "HTTP" ? var.http_config : {}
    iterator = HTTP
    content {
      endpoint = HTTP.endpoint.value
    }
  }

  dynamic "lambda_config" {
    for_each = var.type == "AWS_LAMBDA" ? var.lambda_config : {}
    iterator = AWS_LAMBDA
    content {
      table_name = AWS_LAMBDA.function_arn.value
    }
  }
}
