variable "project_id" {
  description = "The ID of the project to which resources will be applied."
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with."
  type        = string
}

variable "region" {
  type        = string
  description = "The region in which resources will be applied."
}

variable "env" {
  type        = string
  default     = "dev"
  description = "The environment name."
}

variable "api_activated" {
  description = "Are apis activated within the project."
  type        = bool
  default     = false
}

variable "sleep_duration" {
  description = "The duration to sleep before creating resources."
  type        = string
  default     = "5m"
}