variable "location" {
  type        = string
  description = "The location of buckets and functions."
}

variable "pubsub_topic" {
  type        = string
  description = "The ID of the Pubsub Topic."
}

variable "fnd_bucket_name" {
  type        = string
  description = "The bucket name of 9-day Weather Forecast (fnd) data bucket."
}

variable "rhrread_bucket_name" {
  type        = string
  description = "The bucket name of Current Weather Report (rhrread) data bucket."
}

variable "dataset_id" {
  type        = string
  description = "The ID of the dataset, with the project name."
}

variable "forecast_bucket_name" {
  type        = string
  description = "The bucket name of Weather Forecast data bucket."
}

variable "rainfall_bucket_name" {
  type        = string
  description = "The bucket name of Rainfall Forecast data bucket."
}

variable "temperature_bucket_name" {
  type        = string
  description = "The bucket name of Temperature Forecast data bucket."
}