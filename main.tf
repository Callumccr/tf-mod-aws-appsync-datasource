resource "aws_appsync_datasource" "default" {
  for_each         = var.enabled ? { for d in var.datasource_config : d.name => d } : {}
  api_id           = var.api_id
  name             = each.value.name
  type             = each.value.type
  description      = each.value.description
  service_role_arn = each.value.service_role_arn != "" ? each.value.service_role_arn : ""

  dynamic "dynamodb_config" {
    for_each = lookup({ for d in var.datasource_config : d.name => d }, "type", "") == "AMAZON_DYNAMODB" ? { for d in var.datasource_config : d.name => d } : 0
    iterator = dynnamodb
    content {
      table_name             = lookup(dynnamodb.dynamodb_config, "table_name", "")
      region                 = lookup(dynnamodb.dynamodb_config, "region", "")
      use_caller_credentials = lookup(dynnamodb.dynamodb_config, "use_caller_credentials", "")
    }
  }

  # dynamic "elasticsearch_config" {
  #   for_each = var.type == "AMAZON_ELASTICSEARCH" ? list(var.type) : []
  #   content {
  #     endpoint = var.type == "AMAZON_ELASTICSEARCH" ? lookup(var.elasticsearch_config, "endpoint", "") : ""
  #     region   = var.type == "AMAZON_ELASTICSEARCH" ? lookup(var.elasticsearch_config, "region", "") : ""
  #   }
  # }

  # dynamic "http_config" {
  #   for_each = var.type == "HTTP" ? list(var.type) : []
  #   content {
  #     endpoint = var.type == "HTTP" ? lookup(var.http_config, "endpoint", "") : ""
  #   }
  # }

  # dynamic "lambda_config" {
  #   for_each = var.type == "AWS_LAMBDA" ? list(var.type) : []
  #   content {
  #     function_arn = var.type == "AWS_LAMBDA" ? lookup(var.elasticsearch_config, "function_arn", "") : ""
  #   }
  # }

}
