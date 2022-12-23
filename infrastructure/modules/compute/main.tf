resource "google_cloudfunctions2_function" "function" {
    name                        = "download-hko"
    location                    = var.location

    build_config {
        runtime                 = "python310"
        entry_point             = "get_hko_data"
        source {
            storage_source {
                bucket          = var.gcf_bucket_name
                object          = var.gcf_zip_name
          }
        }
    }

    event_trigger {
        event_type              = "google.cloud.pubsub.topic.v1.messagePublished"
        pubsub_topic            = var.pubsub_topic_id
    }
}