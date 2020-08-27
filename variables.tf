# -----------------------------------------------------------------------------
# Variables: Common AWS Provider - Autoloaded from Terragrunt
# -----------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars."
  type        = string
  default     = ""
}

variable "aws_account_id" {
  description = "The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars"
  type        = string
  default     = ""
}

variable "aws_assume_role_arn" {
  description = "(Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars."
  type        = string
  default     = ""
}

variable "aws_assume_role_session_name" {
  description = "(Optional) - The session name to use when making the AssumeRole call."
  type        = string
  default     = ""
}

variable "aws_assume_role_external_id" {
  description = "(Optional) - The external ID to use when making the AssumeRole call."
  type        = string
  default     = ""
}

variable "availability_zones" {
  description = "(Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars."
  type        = list(string)
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-AWS-APPSYNC-DATASOURCE
# -----------------------------------------------------------------------------

variable "enabled" {
  description = "(Optional) -  A Switch that decides whether to create a terraform resource or run a provisioner. Default is true"
  type        = bool
  default     = true
}

variable "datasource_config" {
  description = "(Optional) - A list of maps that contain configuration for appsync resolvers to iteration over"
  type = list(object({
    name              = string
    description       = string
    type              = string
    service_role_arn  = string
    request_template  = string
    response_template = string
    dynamodb_config   = map(any)
  }))
}

variable "api_id" {
  description = "(Required) -  The API ID for the GraphQL API for the DataSource."
  type        = string
}

variable "datasource_name" {
  description = "(Required) -  A user-supplied name for the DataSource."
  type        = string
}

variable "type" {
  description = "(Required) -  The type of the DataSource. Valid values: AWS_LAMBDA, AMAZON_DYNAMODB, AMAZON_ELASTICSEARCH, HTTP, NONE."
  type        = string
}

variable "description" {
  description = "(Optional) -  A description of the DataSource."
  type        = string
  default     = "Managed By Terraform"
}

variable "service_role_arn" {
  description = "(Optional) -  The IAM service role ARN for the data source."
  type        = string
  default     = ""
}

variable "dynamodb_config" {
  description = "(Optional) -  DynamoDB settings"
  type = object({
    table_name             = string
    region                 = string
    use_caller_credentials = bool
  })
  default = {
    table_name             = ""
    region                 = "eu-west-1"
    use_caller_credentials = true
  }
}

variable "elasticsearch_config" {
  description = "(Optional) -  Amazon Elasticsearch settings."
  type = object({
    endpoint = string
    region   = string
  })
  default = {
    endpoint = ""
    region   = "eu-west-1"
  }
}

variable "http_config" {
  description = "(Optional) -  HTTP settings."
  type = object({
    endpoint = string
  })
  default = {
    endpoint = ""
  }
}

variable "lambda_config" {
  description = "(Optional) -  AWS Lambda settings."
  type = object({
    function_arn = string
  })
  default = {
    function_arn = ""
  }
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-LABEL
# -----------------------------------------------------------------------------

variable "namespace" {
  type        = string
  default     = ""
  description = "(Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core'"
}

variable "environment" {
  type        = string
  default     = ""
  description = "(Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod'"
}

variable "name" {
  type        = string
  default     = ""
  description = "(Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "(Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "(Optional) - Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) - Additional tags"
}
