module "buckets" {
  source        = "../modules/buckets"
  names         = ["gcf", "fnd", "rhrread", "forecast", "rainfall", "temperature"]
  prefix        = "hko-${var.env}"
  location      = var.region
  force_destroy = var.env == "dev" ? true : false
}

resource "google_pubsub_topic" "topic" {
  name = "hko-topic"
}

module "schedulers" {
  source = "../modules/schedulers"
  for_each = {
    fnd     = "35 11,16 * * *"
    rhrread = "0 * * * *"
  }
  job_name     = each.key
  job_schedule = each.value
  region       = var.region
  topic_name   = google_pubsub_topic.topic.id
  attributes = {
    data_type   = each.key
    bucket_name = module.buckets.names[each.key]
  }
}

module "extract_function" {
  source           = "../modules/function"
  name             = "extract"
  description      = "Makes HTTP get request to HKO API and uploads the response to the bucket."
  runtime          = "python310"
  entry_point      = "extract"
  bucket_name      = module.buckets.names["gcf"]
  source_directory = "../../function_source/extract"
  event_type       = "google.cloud.pubsub.topic.v1.messagePublished"
  topic_name       = google_pubsub_topic.topic.id
  region           = var.region
}

module "transform_functions" {
  source = "../modules/function"
  for_each = {
    forecast    = "fnd"
    rainfall    = "rhrread"
    temperature = "rhrread"
  }
  name                  = "transform-${each.key}"
  description           = "Normalise ${each.key} data and output as newline-delimited JSON."
  runtime               = "python310"
  entry_point           = "transform_${each.key}"
  bucket_name           = module.buckets.names["gcf"]
  source_directory      = "../../function_source/transform-${each.key}"
  environment_variables = { BUCKET_NAME = module.buckets.names[each.key] }
  event_type            = "google.cloud.storage.object.v1.finalized"
  event_filters = {
    attribute = "bucket"
    value     = module.buckets.names[each.value]
  }
  region = var.region
}

module "bigquery" {
  source                     = "../modules/bigquery"
  dataset_id                 = "hko"
  description                = "Hong Kong Observatory Open Data."
  location                   = var.region
  delete_contents_on_destroy = var.env == "dev" ? true : false
}

module "load_functions" {
  source                = "../modules/function"
  for_each              = toset(["forecast", "rainfall", "temperature"])
  name                  = "load-${each.value}"
  description           = "Load ${each.value} data into the BigQuery table."
  runtime               = "python310"
  entry_point           = "load"
  bucket_name           = module.buckets.names["gcf"]
  source_directory      = "../../function_source/load"
  environment_variables = { DESTINATION = "${module.bigquery.dataset_id}.${each.value}" }
  event_type            = "google.cloud.storage.object.v1.finalized"
  event_filters = {
    attribute = "bucket"
    value     = module.buckets.names[each.value]
  }
  region = var.region
}