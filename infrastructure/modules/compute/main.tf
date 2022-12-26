resource "google_cloudfunctions2_function" "extract" {
    name                        = "hko-extract"
    location                    = var.location

    build_config {
        runtime                 = "python310"
        entry_point             = "extract"
        source {
            storage_source {
                bucket          = var.gcf_bucket_name
                object          = var.gcf_zip_name
          }
        }
    }

    service_config {
        environment_variables   = {
            FND_BUCKET_NAME     = var.fnd_bucket_name
            RHRREAD_BUCKET_NAME = var.rhrread_bucket_name
        }
    }

    event_trigger {
        event_type              = "google.cloud.pubsub.topic.v1.messagePublished"
        pubsub_topic            = var.pubsub_topic_id
    }
}