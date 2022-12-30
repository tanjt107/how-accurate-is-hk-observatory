## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket.fnd](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket.forecast](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket.rainfall](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket.rhrread](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket.temperature](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The bucket location. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fnd_bucket_name"></a> [fnd\_bucket\_name](#output\_fnd\_bucket\_name) | The bucket name of 9-day Weather Forecast (fnd) data bucket. |
| <a name="output_forecast_bucket_name"></a> [forecast\_bucket\_name](#output\_forecast\_bucket\_name) | The bucket name of Weather Forecast data bucket. |
| <a name="output_rainfall_bucket_name"></a> [rainfall\_bucket\_name](#output\_rainfall\_bucket\_name) | The bucket name of Rainfall Forecast data bucket. |
| <a name="output_rhrread_bucket_name"></a> [rhrread\_bucket\_name](#output\_rhrread\_bucket\_name) | The bucket name of Current Weather Report (rhrread) data bucket. |
| <a name="output_temperature_bucket_name"></a> [temperature\_bucket\_name](#output\_temperature\_bucket\_name) | The bucket name of Temperature Forecast data bucket. |