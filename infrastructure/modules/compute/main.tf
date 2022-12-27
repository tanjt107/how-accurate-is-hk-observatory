resource "google_cloudfunctions2_function" "extract" {
    name               = "hko-extract"
    location           = var.location
    description        = "Makes HTTP get request to HKO API and uploads the response to the bucket."

    build_config {
        runtime        = "python310"
        entry_point    = "extract"
        source {
            storage_source {
                bucket = var.gcf_bucket_name
                object = var.extract_zip_name
          }
        }
    }

    event_trigger {
        event_type     = "google.cloud.pubsub.topic.v1.messagePublished"
        pubsub_topic   = var.pubsub_topic_id
    }
}

resource "google_cloudfunctions2_function" "transform_fnd" {
    name                         = "hko-transform-fnd"
    location                     = var.location

    build_config {
        runtime                  = "python310"
        entry_point              = "transform_fnd"
        source {
            storage_source {
                bucket           = var.gcf_bucket_name
                object           = var.transform_fnd_zip_name
          }
        }
    }

    service_config {
        environment_variables    = {
            FORECAST_BUCKET_NAME = var.forecast_bucket_name
        }
    }

    event_trigger {
        event_type               = "google.cloud.storage.object.v1.finalized"
        event_filters {
            attribute            = "bucket"
            value                = var.fnd_bucket_name
        }
    }
}

resource "google_cloudfunctions2_function" "load_forecast" {
    name                      = "hko-load-forecast"
    location                  = var.location

    build_config {
        runtime               = "python310"
        entry_point           = "load"
        source {
            storage_source {
                bucket        = var.gcf_bucket_name
                object        = var.load_zip_name
          }
        }
    }

    service_config {
        environment_variables = {
            DESTINATION       = "${var.project}.${var.dataset_id}.forecast"
        }
    }

    event_trigger {
        event_type            = "google.cloud.storage.object.v1.finalized"
        event_filters {
            attribute         = "bucket"
            value             = var.forecast_bucket_name
        }
    }
}