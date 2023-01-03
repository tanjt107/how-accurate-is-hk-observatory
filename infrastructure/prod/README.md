## Providers

| Name | Version |
|------|---------|
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bigquery"></a> [bigquery](#module\_bigquery) | ../modules/bigquery | n/a |
| <a name="module_buckets"></a> [buckets](#module\_buckets) | ../modules/bucket | n/a |
| <a name="module_extract_function"></a> [extract\_function](#module\_extract\_function) | ../modules/function | n/a |
| <a name="module_load_functions"></a> [load\_functions](#module\_load\_functions) | ../modules/function | n/a |
| <a name="module_project"></a> [project](#module\_project) | ../modules/project | n/a |
| <a name="module_pubsub"></a> [pubsub](#module\_pubsub) | ../modules/pubsub | n/a |
| <a name="module_schedulers"></a> [schedulers](#module\_schedulers) | ../modules/scheduler | n/a |
| <a name="module_transform_functions"></a> [transform\_functions](#module\_transform\_functions) | ../modules/function | n/a |

## Resources

| Name | Type |
|------|------|
| [time_sleep.this](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_activated"></a> [api\_activated](#input\_api\_activated) | Are apis activated within the project. | `bool` | `false` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment name. | `string` | `"prod"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project to which resources will be applied. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region in which resources will be applied. | `string` | n/a | yes |
| <a name="input_sleep_duration"></a> [sleep\_duration](#input\_sleep\_duration) | The duration to sleep before creating resources | `string` | `"3m"` | no |

## Outputs

No outputs.