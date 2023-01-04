## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloudfunctions2_function.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function) | resource |
| [google_storage_bucket_object.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [archive_file.this](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_available_memory_mb"></a> [available\_memory\_mb](#input\_available\_memory\_mb) | The amount of memory in megabytes allotted for the function to use. | `number` | `256` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the GCS bucket. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the function. | `string` | n/a | yes |
| <a name="input_entry_point"></a> [entry\_point](#input\_entry\_point) | The name of a method in the function source which will be invoked when the function is executed. | `string` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | A set of key/value environment variable pairs to assign to the function. | `map(string)` | `{}` | no |
| <a name="input_event_filters"></a> [event\_filters](#input\_event\_filters) | Criteria used to filter events. | `map(string)` | `{}` | no |
| <a name="input_event_trigger_failure_policy"></a> [event\_trigger\_failure\_policy](#input\_event\_trigger\_failure\_policy) | If the function should be retried on failure. | `string` | `"RETRY_POLICY_DO_NOT_RETRY"` | no |
| <a name="input_event_type"></a> [event\_type](#input\_event\_type) | The type of event to observe. | `string` | n/a | yes |
| <a name="input_max_instances"></a> [max\_instances](#input\_max\_instances) | The maximum number of parallel executions of the function. | `number` | `100` | no |
| <a name="input_name"></a> [name](#input\_name) | The name to apply to the function | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project where the resources will be created | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region in which resources will be applied. | `string` | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | The runtime in which the function will be executed. | `string` | n/a | yes |
| <a name="input_source_directory"></a> [source\_directory](#input\_source\_directory) | The contents of this directory will be archived and used as the function source. | `string` | n/a | yes |
| <a name="input_timeout_s"></a> [timeout\_s](#input\_timeout\_s) | The amount of time in seconds allotted for the execution of the function. | `number` | `60` | no |
| <a name="input_topic_name"></a> [topic\_name](#input\_topic\_name) | Name of pubsub topic triggering the function. | `string` | `null` | no |

## Outputs

No outputs.