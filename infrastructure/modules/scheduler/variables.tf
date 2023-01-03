variable "job_name" {
  type        = string
  description = "The name of the scheduled job to run."
}

variable "job_schedule" {
  type        = string
  description = "The job frequency, in cron syntax."
}

variable "time_zone" {
  type        = string
  description = "The timezone to use in scheduler."
  default     = "Asia/Hong_Kong"
}

variable "region" {
  type        = string
  description = "The region in which scheduler will be applied."
}

variable "project_id" {
  type        = string
  description = "The ID of the project where the resources will be created"
}

variable "topic_name" {
  type        = string
  description = "Name of target pubsub topic."
}

variable "attributes" {
  type        = map(string)
  description = "The attributes to send in the topic message."
}