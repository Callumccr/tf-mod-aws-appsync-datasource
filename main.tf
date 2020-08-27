resource "aws_appsync_datasource" "dynamodb" {
  for_each         = var.enabled ? { for d in var.dynamodb_config : d.name => d } : {}
  api_id           = var.api_id
  name             = each.value.name
  type             = each.value.type
  description      = each.value.description
  service_role_arn = each.value.service_role_arn != "" ? each.value.service_role_arn : ""
  dynamodb_config {
    table_name             = each.value.table_name
    region                 = var.aws_region
    use_caller_credentials = each.value.use_caller_credentials
  }
}

resource "aws_appsync_datasource" "elasticsearch" {
  for_each         = var.enabled ? { for d in var.elasticsearch_config : d.name => d } : {}
  api_id           = var.api_id
  name             = each.value.name
  type             = each.value.type
  description      = each.value.description
  service_role_arn = each.value.service_role_arn != "" ? each.value.service_role_arn : ""
  elasticsearch_config {
    endpoint = each.value.endpoint
    region   = var.aws_region
  }
}

resource "aws_appsync_datasource" "http" {
  for_each         = var.enabled ? { for d in var.http_config : d.name => d } : {}
  api_id           = var.api_id
  name             = each.value.name
  type             = each.value.type
  description      = each.value.description
  service_role_arn = each.value.service_role_arn != "" ? each.value.service_role_arn : ""
  http_config {
    endpoint = each.value.endpoint
  }
}

resource "aws_appsync_datasource" "lambda" {
  for_each         = var.enabled ? { for d in var.lambda_config : d.name => d } : {}
  api_id           = var.api_id
  name             = each.value.name
  type             = each.value.type
  description      = each.value.description
  service_role_arn = each.value.service_role_arn != "" ? each.value.service_role_arn : ""
  lambda_config {
    function_arn = each.value.function_arn
  }
}

resource "aws_appsync_datasource" "empty" {
  for_each         = var.enabled ? { for d in var.null_config : d.name => d } : {}
  api_id           = var.api_id
  name             = each.value.name
  type             = each.value.type
  description      = each.value.description
  service_role_arn = each.value.service_role_arn != "" ? each.value.service_role_arn : ""
}
