## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 >= 2.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| api\_id | (Required) -  The API ID for the GraphQL API for the DataSource. | `string` | n/a | yes |
| availability\_zones | (Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars. | `list(string)` | n/a | yes |
| datasource\_name | (Required) -  A user-supplied name for the DataSource. | `string` | n/a | yes |
| type | (Required) -  The type of the DataSource. Valid values: AWS\_LAMBDA, AMAZON\_DYNAMODB, AMAZON\_ELASTICSEARCH, HTTP, NONE. | `string` | n/a | yes |
| attributes | (Optional) - Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| aws\_account\_id | The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars | `string` | `""` | no |
| aws\_assume\_role\_arn | (Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars. | `string` | `""` | no |
| aws\_assume\_role\_external\_id | (Optional) - The external ID to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_assume\_role\_session\_name | (Optional) - The session name to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_region | The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars. | `string` | `""` | no |
| delimiter | (Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| description | (Optional) -  A description of the DataSource. | `string` | `"Managed By Terraform"` | no |
| dynamodb\_config | (Optional) -  DynamoDB settings | <code><pre>object({<br>    table_name             = string<br>    region                 = string<br>    use_caller_credentials = bool<br>  })<br></pre></code> | <code><pre>{<br>  "region": "eu-west-1",<br>  "table_name": "",<br>  "use_caller_credentials": true<br>}<br></pre></code> | no |
| elasticsearch\_config | (Optional) -  Amazon Elasticsearch settings. | <code><pre>object({<br>    endpoint = string<br>    region   = string<br>  })<br></pre></code> | <code><pre>{<br>  "endpoint": "",<br>  "region": "eu-west-1"<br>}<br></pre></code> | no |
| enabled | (Optional) -  A Switch that decides whether to create a terraform resource or run a provisioner. Default is true | `bool` | `true` | no |
| environment | (Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod' | `string` | `""` | no |
| http\_config | (Optional) -  HTTP settings. | <code><pre>object({<br>    endpoint = string<br>  })<br></pre></code> | <code><pre>{<br>  "endpoint": ""<br>}<br></pre></code> | no |
| lambda\_config | (Optional) -  AWS Lambda settings. | <code><pre>object({<br>    function_arn = string<br>  })<br></pre></code> | <code><pre>{<br>  "function_arn": ""<br>}<br></pre></code> | no |
| name | (Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline' | `string` | `""` | no |
| namespace | (Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core' | `string` | `""` | no |
| service\_role\_arn | (Optional) -  The IAM service role ARN for the data source. | `string` | `""` | no |
| tags | (Optional) - Additional tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the datasource |

