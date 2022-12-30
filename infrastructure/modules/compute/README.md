## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Resources

| Name | Type |
|------|------|
| [google_cloudfunctions2_function.extract](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function) | resource |
| [google_cloudfunctions2_function.load_forecast](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function) | resource |
| [google_cloudfunctions2_function.load_rainfall](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function) | resource |
| [google_cloudfunctions2_function.load_temperature](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function) | resource |
| [google_cloudfunctions2_function.transform_fnd](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function) | resource |
| [google_cloudfunctions2_function.transform_rhrread](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function) | resource |
| [google_storage_bucket.gcf](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_object.extract](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [google_storage_bucket_object.load](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [google_storage_bucket_object.transform_fnd](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [google_storage_bucket_object.transform_rhrread](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dataset_id"></a> [dataset\_id](#input\_dataset\_id) | The ID of the dataset, with the project name. | `string` | n/a | yes |
| <a name="input_fnd_bucket_name"></a> [fnd\_bucket\_name](#input\_fnd\_bucket\_name) | The bucket name of 9-day Weather Forecast (fnd) data bucket. | `string` | n/a | yes |
| <a name="input_forecast_bucket_name"></a> [forecast\_bucket\_name](#input\_forecast\_bucket\_name) | The bucket name of Weather Forecast data bucket. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location of buckets and functions. | `string` | n/a | yes |
| <a name="input_pubsub_topic"></a> [pubsub\_topic](#input\_pubsub\_topic) | The ID of the Pubsub Topic. | `string` | n/a | yes |
| <a name="input_rainfall_bucket_name"></a> [rainfall\_bucket\_name](#input\_rainfall\_bucket\_name) | The bucket name of Rainfall Forecast data bucket. | `string` | n/a | yes |
| <a name="input_rhrread_bucket_name"></a> [rhrread\_bucket\_name](#input\_rhrread\_bucket\_name) | The bucket name of Current Weather Report (rhrread) data bucket. | `string` | n/a | yes |
| <a name="input_temperature_bucket_name"></a> [temperature\_bucket\_name](#input\_temperature\_bucket\_name) | The bucket name of Temperature Forecast data bucket. | `string` | n/a | yes |