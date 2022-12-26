module "analytics" {
    source            = "./modules/analytics"
    pubsub_topic_name = var.pubsub_topic_name
}

module "compute" {
    source               = "./modules/compute"
    location             = var.region
    extract_zip_name     = module.storage.extract_zip_name
    forecast_bucket_name = var.forecast_bucket_name
    forecast_zip_name    = module.storage.forecast_zip_name
    fnd_bucket_name      = var.fnd_bucket_name
    gcf_bucket_name      = var.gcf_bucket_name
    pubsub_topic_id      = module.analytics.pubsub_topic_id
    rhrread_bucket_name  = var.rhrread_bucket_name
}

module "devtools" {
    source           = "./modules/devtools"
    pubsub_topic_id  = module.analytics.pubsub_topic_id
    fnd_job_name     = var.fnd_job_name
    rhrread_job_name = var.rhrread_job_name
}

module "storage" {
    source               = "./modules/storage"
    location             = var.region
    fnd_bucket_name      = var.fnd_bucket_name
    forecast_bucket_name = var.forecast_bucket_name
    gcf_bucket_name      = var.gcf_bucket_name
    rhrread_bucket_name  = var.rhrread_bucket_name
}