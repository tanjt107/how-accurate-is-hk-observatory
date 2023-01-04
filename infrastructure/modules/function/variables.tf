variable "name" {
  type        = string
  description = "The name to apply to the function"
}

variable "description" {
  type        = string
  description = "The description of the function."
}

variable "runtime" {
  type        = string
  description = "The runtime in which the function will be executed."
}

variable "entry_point" {
  type        = string
  description = "The name of a method in the function source which will be invoked when the function is executed."
}

variable "region" {
  type        = string
  description = "The region in which resources will be applied."
}

variable "project_id" {
  type        = string
  description = "The ID of the project where the resources will be created"
}

variable "bucket_name" {
  type        = string
  description = "The name of the GCS bucket."
}

variable "source_directory" {
  type        = string
  description = "The contents of this directory will be archived and used as the function source."
}

variable "timeout_s" {
  type        = number
  default     = 60
  description = "The amount of time in seconds allotted for the execution of the function."
}

variable "available_memory_mb" {
  type        = number
  default     = 256
  description = "The amount of memory in megabytes allotted for the function to use."
}

variable "environment_variables" {
  type        = map(string)
  default     = {}
  description = "A set of key/value environment variable pairs to assign to the function."
}

variable "max_instances" {
  type        = number
  default     = 100
  description = "The maximum number of parallel executions of the function."
}

variable "event_type" {
  type        = string
  description = "The type of event to observe."
}

variable "event_filters" {
  type        = map(string)
  default     = {}
  description = "Criteria used to filter events."
}

variable "topic_name" {
  type        = string
  default     = null
  description = "Name of pubsub topic triggering the function."
}

variable "event_trigger_failure_policy" {
  type        = string
  default     = "RETRY_POLICY_DO_NOT_RETRY"
  description = "If the function should be retried on failure."
}