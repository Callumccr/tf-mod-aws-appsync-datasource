resource "aws_appsync_datasource" "dynamodb" {
  for_each         = var.enabled == true && length(var.dynamodb_config) > 0 ? { for d in var.dynamodb_config : d.name => d } : {}
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
  for_each         = var.enabled == true && length(var.elasticsearch_config) > 0 ? { for d in var.elasticsearch_config : d.name => d } : {}
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
  for_each         = var.enabled == true && length(var.http_config) > 0 ? { for d in var.http_config : d.name => d } : {}
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
  for_each         = var.enabled == true && length(var.lambda_config) > 0 ? { for d in var.lambda_config : d.name => d } : {}
  api_id           = var.api_id
  name             = each.value.name
  type             = each.value.type
  description      = each.value.description
  service_role_arn = each.value.service_role_arn != "" ? each.value.service_role_arn : ""
  lambda_config {
    function_arn = each.value.function_arn
  }
}

resource "aws_appsync_datasource" "null" {
  for_each         = var.enabled == true && length(var.empty_config) > 0 ? { for d in var.empty_config : d.name => d } : {}
  api_id           = var.api_id
  name             = each.value.name
  type             = each.value.type
  description      = each.value.description
  service_role_arn = each.value.service_role_arn != "" ? each.value.service_role_arn : ""
}

resource "null_resource" "kylin_token" {
  count = var.enabled && list(var.kylin_token_config) != [] ? 1 : 0
  triggers = {
    kylin_config = jsonencode(var.kylin_token_config)
  }
  provisioner "local-exec" {
    interpreter = [var.interpreter, "-c"]
    environment = {
      AWS_ACCESS_KEY_ID     = var.aws_access_key_id,
      AWS_SECRET_ACCESS_KEY = var.aws_secret_access_key
    }
    command = <<EOT
              set -e
                aws_cli_assume_role_arn="${var.aws_assume_role_arn}"
                aws_cli_assume_role_session_name="terraform"

              if [[ -n "$aws_cli_assume_role_arn" && -n "$aws_cli_assume_role_session_name" ]] ; then
                temp_role=$(aws sts assume-role \
                    --role-arn "$aws_cli_assume_role_arn" \
                    --role-session-name "$aws_cli_assume_role_session_name" )
                
                export AWS_ACCESS_KEY_ID=$(echo $temp_role | jq -r .Credentials.AccessKeyId)
                export AWS_SECRET_ACCESS_KEY=$(echo $temp_role | jq -r .Credentials.SecretAccessKey)
                export AWS_SESSION_TOKEN=$(echo $temp_role | jq -r .Credentials.SessionToken)

                env | grep AWS_
              fi

                echo 'Creating Kylin Token Datasource...'
                aws appsync create-data-source \
                --api-id="${var.api_id}" \
                --type="${lookup(var.kylin_token_config, "type", "")}" \
                --name="${lookup(var.kylin_token_config, "name", "")}" \
                --description="${lookup(var.kylin_token_config, "description", "")}" \
                --service-role-arn="${lookup(var.kylin_token_config, "service_role_arn", "")}" \
                --http-config="${jsonencode(var.kylin_token_config, "http_config", "")}"
                EOT

  }
}
