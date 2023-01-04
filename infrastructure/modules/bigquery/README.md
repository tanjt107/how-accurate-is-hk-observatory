## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_bigquery_dataset.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset) | resource |
| [google_bigquery_dataset_access.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset_access) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dataset_id"></a> [dataset\_id](#input\_dataset\_id) | Unique ID for the dataset being provisioned. | `string` | n/a | yes |
| <a name="input_delete_contents_on_destroy"></a> [delete\_contents\_on\_destroy](#input\_delete\_contents\_on\_destroy) | If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Dataset description. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The regional location for the dataset. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project where the dataset and table are created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dataset_id"></a> [dataset\_id](#output\_dataset\_id) | The ID of the dataset, with the project name. |