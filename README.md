<!-- 














  ** DO NOT EDIT THIS FILE
  ** 
  ** This file was automatically generated by the `build-harness`. 
  ** 1) Make all changes to `README.yaml` 
  ** 2) Run `make init` (you only need to do this once)
  ** 3) Run`make readme` to rebuild this file. 
  **
  ** (We maintain HUNDREDS of open source projects. This is how we maintain our sanity.)
  **















  -->

#

[![README Header][logo]][website]

# tf-mod-aws-appsync-datasource

## Module description


This module creates an AWS AppSync DataSource.




Project: **[%!s(<nil>)](%!s(<nil>))** : [[%!s(<nil>)](%!s(<nil>))] | [[%!s(<nil>)](%!s(<nil>))] 







## Usage

**IMPORTANT:** The `master` branch is used in `source` just as an example. In your code, do not pin to `master` because there may be breaking changes between releases.
Instead pin to the release tag (e.g. `?ref=tags/x.y.z`) of one of our [latest releases](https://github.com/https://github.com/callumccr/tf-mod-aws-appsync-datasource/releases).


The below values shown in the usage of this module are purely representative, please replace desired values as required.

TO-DO

```hcl
```





## Examples
Simple and advanced examples of this project.

### Advanced Example 1:

TO-DO

  ```hcl
  ```


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
| description | (Optional) -  A description of the DataSource. | `string` | `"Managed By Terramform"` | no |
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




## Related Projects

You can find more [Terraform Modules](terraform_modules) by vising the link.

Additionally, check out these other related, and maintained projects.

- [%!s(<nil>)](%!s(<nil>)) - %!s(<nil>)





## Help

**Got a question?** We got answers. 

File a Github [issue](https://github.com/callumccr/tf-mod-aws-appsync-datasource/issues), or message us on [Slack][slack]


### Contributors

|  [![Callum Robertson][callumccr_avatar]][callumccr_homepage]<br/>[Callum Robertson][callumccr_homepage] |
|---|


  [callumccr_homepage]: https://www.linkedin.com/in/callum-robertson-1a55b6110/

  [callumccr_avatar]: https://media-exp1.licdn.com/dms/image/C5603AQHb_3oZMZA5YA/profile-displayphoto-shrink_200_200/0?e=1588809600&v=beta&t=5QQQAlHrm1od5fQNZwdjOtbZWvsGcgNBqFRhZWgnPx4




---



---


[![README Footer][logo]][website]

  [logo]: https://wariva-github-assets.s3.eu-west-2.amazonaws.com/logo.png
  [website]: https://www.linkedin.com/company/52152765/admin/
  [github]: https://github.com/Callumccr
  [slack]: https://wariva.slack.com
  [linkedin]: https://www.linkedin.com/in/callum-robertson-1a55b6110/
  [terraform_modules]: https://github.com/Callumccr