module "analytics" {
    source            = "./modules/analytics"
    location          = var.region
}

module "compute" {
    source                     = "./modules/compute"
    project                    = var.project_name
    location                   = var.region
    dataset_id                 = module.analytics.dataset_id
    extract_zip_name           = module.storage.extract_zip_name
    fnd_bucket_name            = module.storage.fnd_bucket_name
    forecast_bucket_name       = module.storage.forecast_bucket_name
    gcf_bucket_name            = module.storage.gcf_bucket_name
    rainfall_bucket_name       = module.storage.rainfall_bucket_name
    temperature_bucket_name    = module.storage.temperature_bucket_name
    transform_fnd_zip_name     = module.storage.transform_fnd_zip_name
    transform_rhrread_zip_name = module.storage.transform_rhrread_zip_name
    load_zip_name              = module.storage.load_zip_name
    pubsub_topic_id            = module.analytics.pubsub_topic_id
    rhrread_bucket_name        = module.storage.rhrread_bucket_name
}

module "devtools" {
    source              = "./modules/devtools"
    pubsub_topic_id     = module.analytics.pubsub_topic_id
    fnd_bucket_name     = module.storage.fnd_bucket_name
    rhrread_bucket_name = module.storage.rhrread_bucket_name
}

module "storage" {
    source                  = "./modules/storage"
    location                = var.region
    fnd_bucket_name         = module.storage.fnd_bucket_name
    forecast_bucket_name    = module.storage.forecast_bucket_name
    gcf_bucket_name         = module.storage.gcf_bucket_name
    rainfall_bucket_name    = module.storage.rainfall_bucket_name
    rhrread_bucket_name     = module.storage.rhrread_bucket_name
    temperature_bucket_name = module.storage.temperature_bucket_name
}