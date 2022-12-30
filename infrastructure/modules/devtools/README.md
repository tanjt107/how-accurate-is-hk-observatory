## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Resources

| Name | Type |
|------|------|
| [google_cloud_scheduler_job.fnd](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job) | resource |
| [google_cloud_scheduler_job.rhrread](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job) | resource |
| [google_pubsub_topic.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fnd_bucket_name"></a> [fnd\_bucket\_name](#input\_fnd\_bucket\_name) | The bucket name of 9-day Weather Forecast (fnd) data bucket. | `string` | n/a | yes |
| <a name="input_rhrread_bucket_name"></a> [rhrread\_bucket\_name](#input\_rhrread\_bucket\_name) | The bucket name of Current Weather Report (rhrread) data bucket. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_topic_id"></a> [topic\_id](#output\_topic\_id) | The ID of the topic. |