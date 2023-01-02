variable "project_id" {
  description = "The ID of the project to which resources will be applied."
  type        = string
}

variable "region" {
  type        = string
  description = "The region in which resources will be applied."
}

variable "env" {
  type        = string
  description = "The environment name."
}