variable "name" {
  description = "Bucket name."
  type        = string
}

variable "prefix" {
  description = "Prefix used to generate the bucket name."
  type        = string
  default     = ""
}

variable "location" {
  description = "Bucket location."
  type        = string
}

variable "force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects."
  type        = bool
  default     = false
}

variable "project_id" {
  description = "Bucket project id."
  type        = string
}