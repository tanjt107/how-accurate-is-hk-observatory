module "analytics" {
  source   = "./modules/analytics"
  location = var.region
}

module "compute" {
  source                  = "./modules/compute"
  location                = var.region
  pubsub_topic            = module.devtools.topic_id
  fnd_bucket_name         = module.storage.fnd_bucket_name
  rhrread_bucket_name     = module.storage.rhrread_bucket_name
  dataset_id              = module.analytics.dataset_id
  forecast_bucket_name    = module.storage.forecast_bucket_name
  rainfall_bucket_name    = module.storage.rainfall_bucket_name
  temperature_bucket_name = module.storage.temperature_bucket_name
}

module "devtools" {
  source              = "./modules/devtools"
  fnd_bucket_name     = module.storage.fnd_bucket_name
  rhrread_bucket_name = module.storage.rhrread_bucket_name
}

module "storage" {
  source   = "./modules/storage"
  location = var.region
}