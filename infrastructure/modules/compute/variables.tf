variable "location" {
  type        = string
  description = "The location of buckets and functions."
}

variable "pubsub_topic" {
  type        = string
  description = "The ID of the Pubsub Topic."
}

variable "bucket_names" {
  # type        = object({string = string})
  description = "The name of buckets."
}

variable "dataset_id" {
  type        = string
  description = "The ID of the dataset, with the project name."
}