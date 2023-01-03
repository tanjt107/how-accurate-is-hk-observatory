data "archive_file" "this" {
  type        = "zip"
  output_path = "${var.source_directory}.zip"
  source_dir  = var.source_directory
}

resource "google_storage_bucket_object" "this" {
  bucket = var.bucket_name
  name   = "${split("/", var.source_directory)[length(split("/", var.source_directory)) - 1]}.zip"
  source = data.archive_file.this.output_path
}

resource "google_cloudfunctions2_function" "this" {
  name        = var.name
  description = var.description
  location    = var.region
  project     = var.project_id

  build_config {
    runtime     = var.runtime
    entry_point = var.entry_point
    source {
      storage_source {
        bucket = var.bucket_name
        object = google_storage_bucket_object.this.name
      }
    }
  }

  service_config {
    timeout_seconds       = var.timeout_s
    available_memory      = "${var.available_memory_mb}M"
    environment_variables = var.environment_variables
    max_instance_count    = var.max_instances
  }

  event_trigger {
    trigger_region = var.region
    event_type     = var.event_type
    dynamic "event_filters" {
      for_each = length(var.event_filters) > 0 ? [1] : []
      content {
        attribute = var.event_filters["attribute"]
        value     = var.event_filters["value"]
      }
    }
    pubsub_topic = var.topic_name
    retry_policy = var.event_trigger_failure_policy
  }
}