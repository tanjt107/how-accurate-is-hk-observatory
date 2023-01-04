## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project) | resource |
| [google_project_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_storage_project_service_account.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/storage_project_service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_api_identities"></a> [activate\_api\_identities](#input\_activate\_api\_identities) | The list of service identities (Google Managed service account for the API) to force-create for the project (e.g. in order to grant additional roles). | <pre>list(object({<br>    api  = string<br>    role = string<br>  }))</pre> | `[]` | no |
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | The list of apis to activate within the project. | `list(string)` | `[]` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with. | `string` | n/a | yes |
| <a name="input_disable_dependent_services"></a> [disable\_dependent\_services](#input\_disable\_dependent\_services) | Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. | `bool` | `true` | no |
| <a name="input_disable_services_on_destroy"></a> [disable\_services\_on\_destroy](#input\_disable\_services\_on\_destroy) | Whether project services will be disabled when the resources are destroyed. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the project. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The GCP project you want to enable APIs on | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_enabled_apis"></a> [enabled\_apis](#output\_enabled\_apis) | Enabled APIs in the project. |
| <a name="output_enabled_iam_members"></a> [enabled\_iam\_members](#output\_enabled\_iam\_members) | IAM policy to grant a role to a new member. |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | ID of the project. |