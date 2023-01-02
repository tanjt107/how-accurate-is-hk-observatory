## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.47.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bigquery"></a> [bigquery](#module\_bigquery) | ../modules/bigquery | n/a |
| <a name="module_buckets"></a> [buckets](#module\_buckets) | ../modules/buckets | n/a |
| <a name="module_extract_function"></a> [extract\_function](#module\_extract\_function) | ../modules/function | n/a |
| <a name="module_load_functions"></a> [load\_functions](#module\_load\_functions) | ../modules/function | n/a |
| <a name="module_schedulers"></a> [schedulers](#module\_schedulers) | ../modules/schedulers | n/a |
| <a name="module_transform_functions"></a> [transform\_functions](#module\_transform\_functions) | ../modules/function | n/a |

## Resources

| Name | Type |
|------|------|
| [google_pubsub_topic.topic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | The environment name. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project to which resources will be applied. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region in which resources will be applied. | `string` | n/a | yes |