resource "google_cloud_scheduler_job" "fnd" {
  name              = "fnd"
  schedule          = "0 * * * *"
  time_zone         = "Asia/Hong_Kong"

  pubsub_target {
    topic_name      = var.pubsub_topic_id
    attributes      = {
        endpoint    = "fnd"
        bucket_name = var.fnd_bucket_name
    }
  }
}

resource "google_cloud_scheduler_job" "rhrread" {
  name              = "rhrread"
  schedule          = "5 * * * *"

  pubsub_target {
    topic_name      = var.pubsub_topic_id
    attributes      = {
        endpoint    = "rhrread"
        bucket_name = var.rhrread_bucket_name
    }
  }
}