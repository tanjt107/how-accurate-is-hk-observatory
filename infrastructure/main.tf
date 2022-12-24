module "analytics" {
    source            = "./modules/analytics"
    pubsub_topic_name = var.pubsub_topic_name
}

module "compute" {
    source              = "./modules/compute"
    location            = var.region
    gcf_bucket_name     = var.gcf_bucket_name
    gcf_zip_name        = module.storage.gcf_zip_name
    pubsub_topic_id     = module.analytics.pubsub_topic_id
}

module "devtools" {
    source              = "./modules/devtools"
    pubsub_topic_id     = module.analytics.pubsub_topic_id
    fnd_job_name        = var.fnd_job_name
    rhrread_job_name    = var.rhrread_job_name
    fnd_bucket_name     = var.fnd_raw_bucket_name
    rhrread_bucket_name = var.rhrread_raw_bucket_name
}

module "storage" {
    source                  = "./modules/storage"
    bucket_location         = var.bucket_location
    fnd_raw_bucket_name     = var.fnd_raw_bucket_name
    gcf_bucket_name         = var.gcf_bucket_name
    rhrread_raw_bucket_name = var.rhrread_raw_bucket_name
}