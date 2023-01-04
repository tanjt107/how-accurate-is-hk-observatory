variable "name" {
  description = "The name for the project."
  type        = string
}

variable "project_id" {
  description = "The GCP project you want to enable APIs on."
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with."
  type        = string
}

variable "activate_apis" {
  description = "The list of apis to activate within the project."
  type        = list(string)
  default     = []
}

variable "activate_api_identities" {
  description = "The list of service identities (Google Managed service account for the API) to force-create for the project (e.g. in order to grant additional roles)."
  type = list(object({
    api  = string
    role = string
  }))
  default = []
}

variable "disable_services_on_destroy" {
  description = "Whether project services will be disabled when the resources are destroyed."
  default     = true
  type        = bool
}

variable "disable_dependent_services" {
  description = "Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed."
  default     = true
  type        = bool
}