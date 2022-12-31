resource "google_storage_bucket" "gcf" {
  name     = "hko-gcf"
  location = var.location
}

resource "google_storage_bucket_object" "extract" {
  name   = "extract.zip"
  bucket = google_storage_bucket.gcf.name
  source = "../functions/extract.zip"
}

resource "google_cloudfunctions2_function" "extract" {
  name        = "hko-extract"
  location    = var.location
  description = "Makes HTTP get request to HKO API and uploads the response to the bucket."

  build_config {
    runtime     = "python310"
    entry_point = "extract"
    source {
      storage_source {
        bucket = google_storage_bucket.gcf.name
        object = google_storage_bucket_object.extract.name
      }
    }
  }

  event_trigger {
    event_type   = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic = var.pubsub_topic
  }
}

resource "google_storage_bucket_object" "transform_fnd" {
  name   = "transform-fnd.zip"
  bucket = google_storage_bucket.gcf.name
  source = "../functions/transform-fnd.zip"
}

resource "google_cloudfunctions2_function" "transform_fnd" {
  name        = "hko-transform-fnd"
  location    = var.location
  description = "Normalise 9-day Weather Forecast (fnd) data and output as newline-delimited JSON."

  build_config {
    runtime     = "python310"
    entry_point = "transform_fnd"
    source {
      storage_source {
        bucket = google_storage_bucket.gcf.name
        object = google_storage_bucket_object.transform_fnd.name
      }
    }
  }

  service_config {
    environment_variables = {
      FORECAST_BUCKET_NAME = var.bucket_names["forecast"]
    }
  }

  event_trigger {
    event_type = "google.cloud.storage.object.v1.finalized"
    event_filters {
      attribute = "bucket"
      value     = var.bucket_names["fnd"]
    }
  }
}

resource "google_storage_bucket_object" "transform_rhrread" {
  name   = "transform-rhrread.zip"
  bucket = google_storage_bucket.gcf.name
  source = "../functions/transform-rhrread.zip"
}

resource "google_cloudfunctions2_function" "transform_rhrread" {
  name        = "hko-transform-rhrread"
  location    = var.location
  description = "Normalise Current Weather Report (rhrread) data and output as newline-delimited JSON."

  build_config {
    runtime     = "python310"
    entry_point = "transform_rhrread"
    source {
      storage_source {
        bucket = google_storage_bucket.gcf.name
        object = google_storage_bucket_object.transform_rhrread.name
      }
    }
  }

  service_config {
    environment_variables = {
      RAINFALL_BUCKET_NAME    = var.bucket_names["rainfall"]
      TEMPERATURE_BUCKET_NAME = var.bucket_names["temperature"]
    }
  }

  event_trigger {
    event_type = "google.cloud.storage.object.v1.finalized"
    event_filters {
      attribute = "bucket"
      value     = var.bucket_names["rhrread"]
    }
  }
}

resource "google_storage_bucket_object" "load" {
  name   = "load.zip"
  bucket = google_storage_bucket.gcf.name
  source = "../functions/load.zip"
}

resource "google_cloudfunctions2_function" "load" {
  for_each = toset(["forecast", "rainfall", "temperature"])

  name        = "hko-load-${each.value}"
  location    = var.location
  description = "Load ${each.value} data into the BigQuery table."

  build_config {
    runtime     = "python310"
    entry_point = "load"
    source {
      storage_source {
        bucket = google_storage_bucket.gcf.name
        object = google_storage_bucket_object.load.name
      }
    }
  }

  service_config {
    environment_variables = {
      DESTINATION = "${var.dataset_id}.${each.value}"
    }
  }

  event_trigger {
    event_type = "google.cloud.storage.object.v1.finalized"
    event_filters {
      attribute = "bucket"
      value     = var.bucket_names[each.value]
    }
  }
}