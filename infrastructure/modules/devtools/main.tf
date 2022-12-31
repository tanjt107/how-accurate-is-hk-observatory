resource "google_pubsub_topic" "this" {
  name = "topic"
}

resource "google_cloud_scheduler_job" "fnd" {
  name      = "fnd"
  schedule  = "35 11,16 * * *"
  time_zone = "Asia/Hong_Kong"

  pubsub_target {
    topic_name = google_pubsub_topic.this.id
    attributes = {
      data_type   = "fnd"
      bucket_name = var.bucket_names["fnd"]
    }
  }
}

resource "google_cloud_scheduler_job" "rhrread" {
  name     = "rhrread"
  schedule = "5 * * * *"

  pubsub_target {
    topic_name = google_pubsub_topic.this.id
    attributes = {
      data_type   = "rhrread"
      bucket_name = var.bucket_names["rhrread"]
    }
  }
}