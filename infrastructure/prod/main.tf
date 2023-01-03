module "project" {
  name            = "How accurate is HK Observatory"
  source          = "../modules/project"
  project_id      = var.project_id
  billing_account = var.billing_account
  activate_apis = [
    "artifactregistry.googleapis.com",
    "bigquery.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudfunctions.googleapis.com",
    "run.googleapis.com",
    "cloudscheduler.googleapis.com",
    "storage.googleapis.com",
    "eventarc.googleapis.com"
  ]
  activate_api_identities = [{
    api  = "compute.googleapis.com",
    role = "roles/pubsub.publisher"
  }]
}

# API can take a few minutes to activate.
resource "time_sleep" "this" {
  depends_on      = [module.project.enabled_apis, module.project.enabled_iam_members]
  create_duration = var.api_activated ? 0 : var.sleep_duration
}

module "buckets" {
  source = "../modules/bucket"
  for_each = toset([
    "gcf",
    "fnd",
    "rhrread",
    "forecast",
    "rainfall",
    "temperature"
  ])
  name          = each.value
  prefix        = "hko-${var.env}"
  location      = var.region
  force_destroy = var.env == "dev" ? true : false
  project_id    = module.project.project_id
}

module "pubsub" {
  source     = "../modules/pubsub"
  topic      = "hko-topic"
  project_id = module.project.project_id

  depends_on = [time_sleep.this]
}

module "schedulers" {
  source = "../modules/scheduler"
  for_each = {
    fnd     = "35 11,16 * * *"
    rhrread = "0 * * * *"
  }
  job_name     = each.key
  job_schedule = each.value
  region       = var.region
  topic_name   = module.pubsub.id
  project_id   = module.project.project_id
  attributes = {
    data_type   = each.key
    bucket_name = module.buckets[each.key].name
  }

  depends_on = [time_sleep.this]
}

module "extract_function" {
  source           = "../modules/function"
  name             = "extract"
  description      = "Makes HTTP get request to HKO API and uploads the response to the bucket."
  runtime          = "python310"
  region           = var.region
  project_id       = module.project.project_id
  entry_point      = "extract"
  bucket_name      = module.buckets["gcf"].name
  source_directory = "../../function_source/extract"
  event_type       = "google.cloud.pubsub.topic.v1.messagePublished"
  topic_name       = module.pubsub.id

  depends_on = [time_sleep.this]
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
  region                = var.region
  project_id            = module.project.project_id
  entry_point           = "transform_${each.key}"
  bucket_name           = module.buckets["gcf"].name
  source_directory      = "../../function_source/transform-${each.key}"
  environment_variables = { BUCKET_NAME = module.buckets[each.key].name }
  event_type            = "google.cloud.storage.object.v1.finalized"
  event_filters = {
    attribute = "bucket"
    value     = module.buckets[each.value].name
  }

  depends_on = [time_sleep.this]
}

module "bigquery" {
  source                     = "../modules/bigquery"
  dataset_id                 = "hko"
  description                = "Hong Kong Observatory Open Data."
  location                   = var.region
  project_id                 = module.project.project_id
  delete_contents_on_destroy = var.env == "dev" ? true : false

  depends_on = [time_sleep.this]
}

module "load_functions" {
  source                = "../modules/function"
  for_each              = toset(["forecast", "rainfall", "temperature"])
  name                  = "load-${each.value}"
  description           = "Load ${each.value} data into the BigQuery table."
  runtime               = "python310"
  region                = var.region
  project_id            = module.project.project_id
  entry_point           = "load"
  bucket_name           = module.buckets["gcf"].name
  source_directory      = "../../function_source/load"
  environment_variables = { DESTINATION = "${module.bigquery.dataset_id}.${each.value}" }
  event_type            = "google.cloud.storage.object.v1.finalized"
  event_filters = {
    attribute = "bucket"
    value     = module.buckets[each.value].name
  }

  depends_on = [time_sleep.this]
}