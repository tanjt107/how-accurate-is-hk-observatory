resource "google_cloud_scheduler_job" "job" {
  name      = var.job_name
  schedule  = var.job_schedule
  time_zone = var.time_zone
  region    = var.region

  pubsub_target {
    topic_name = var.topic_name
    attributes = var.attributes
  }
}