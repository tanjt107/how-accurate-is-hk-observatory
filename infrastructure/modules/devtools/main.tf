resource "google_cloud_scheduler_job" "fnd" {
  name              = var.fnd_job_name
  schedule          = "0 * * * *"

  pubsub_target {
    topic_name      = var.pubsub_topic_id
    attributes      = {
        endpoint    = "fnd"
        bucket_name = var.fnd_bucket_name
    }
  }
}

resource "google_cloud_scheduler_job" "rhrread" {
  name              = var.rhrread_job_name
  schedule          = "0 * * * *"

  pubsub_target {
    topic_name      = var.pubsub_topic_id
    attributes      = {
        endpoint    = "rhrread"
        bucket_name = var.rhrread_bucket_name
    }
  }
}