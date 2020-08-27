## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 >= 2.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| api\_id | (Required) -  The API ID for the GraphQL API for the DataSource. | `string` | n/a | yes |
| availability\_zones | (Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars. | `list(string)` | n/a | yes |
| dynamodb\_config | (Optional) - A list of maps that contain configuration for appsync dynamodb configuration to iteration over | <code><pre>list(object({<br>    name                   = string<br>    description            = string<br>    type                   = string<br>    service_role_arn       = string<br>    table_name             = string<br>    use_caller_credentials = string<br>  }))<br></pre></code> | n/a | yes |
| elasticsearch\_config | (Optional) - A list of maps that contain configuration for appsync elasticsearch configuration to iteration over | <code><pre>list(object({<br>    name             = string<br>    description      = string<br>    type             = string<br>    service_role_arn = string<br>    endpoint         = string<br>  }))<br></pre></code> | n/a | yes |
| empty\_config | (Optional) - A list of maps that contain configuration for appsync dynamodb configuration to iteration over | <code><pre>list(object({<br>    name             = string<br>    description      = string<br>    type             = string<br>    service_role_arn = string<br>  }))<br></pre></code> | n/a | yes |
| http\_config | (Optional) - A list of maps that contain configuration for appsync http configuration to iteration over | <code><pre>list(object({<br>    name             = string<br>    description      = string<br>    type             = string<br>    service_role_arn = string<br>    endpoint         = string<br>  }))<br></pre></code> | n/a | yes |
| lambda\_config | (Optional) - A list of maps that contain configuration for appsync empty configuration to iteration over | <code><pre>list(object({<br>    name         = string<br>    description  = string<br>    type         = string<br>    function_arn = string<br>  }))<br></pre></code> | n/a | yes |
| attributes | (Optional) - Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| aws\_account\_id | The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars | `string` | `""` | no |
| aws\_assume\_role\_arn | (Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars. | `string` | `""` | no |
| aws\_assume\_role\_external\_id | (Optional) - The external ID to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_assume\_role\_session\_name | (Optional) - The session name to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_region | The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars. | `string` | `""` | no |
| delimiter | (Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| enabled | (Optional) -  A Switch that decides whether to create a terraform resource or run a provisioner. Default is true | `bool` | `true` | no |
| environment | (Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod' | `string` | `""` | no |
| name | (Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline' | `string` | `""` | no |
| namespace | (Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core' | `string` | `""` | no |
| tags | (Optional) - Additional tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| dynamodb | The ARN && Name of the dynamodb datasources |
| elasticsearch | The ARN && Name of the elasticsearch datasources |
| http | The ARN && Name of the datasource |
| lambda | The ARN && Name of the datasource |
| null | The ARN && Name of the datasource |

