variable "dataset_id" {
  description = "Unique ID for the dataset being provisioned."
  type        = string
}

variable "description" {
  description = "Dataset description."
  type        = string
  default     = null
}

variable "location" {
  description = "The regional location for the dataset."
  type        = string
}

variable "project_id" {
  description = "Project where the dataset and table are created"
  type        = string
}

variable "delete_contents_on_destroy" {
  description = "If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present."
  type        = bool
  default     = false
}