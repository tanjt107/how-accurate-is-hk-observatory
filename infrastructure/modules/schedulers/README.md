## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloud_scheduler_job.job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | The attributes to send in the topic message. | `map(string)` | n/a | yes |
| <a name="input_job_name"></a> [job\_name](#input\_job\_name) | The name of the scheduled job to run. | `string` | n/a | yes |
| <a name="input_job_schedule"></a> [job\_schedule](#input\_job\_schedule) | The job frequency, in cron syntax. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region in which scheduler will be applied. | `string` | n/a | yes |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | The timezone to use in scheduler. | `string` | `"Asia/Hong_Kong"` | no |
| <a name="input_topic_name"></a> [topic\_name](#input\_topic\_name) | Name of target pubsub topic. | `string` | n/a | yes |

## Outputs

No outputs.