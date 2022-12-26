module "analytics" {
    source            = "./modules/analytics"
    pubsub_topic_name = var.pubsub_topic_name
}

module "compute" {
    source              = "./modules/compute"
    location            = var.region
    fnd_bucket_name     = var.fnd_bucket_name
    gcf_bucket_name     = var.gcf_bucket_name
    gcf_zip_name        = module.storage.gcf_zip_name
    pubsub_topic_id     = module.analytics.pubsub_topic_id
    rhrread_bucket_name = var.rhrread_bucket_name
}

module "devtools" {
    source              = "./modules/devtools"
    pubsub_topic_id     = module.analytics.pubsub_topic_id
    fnd_job_name        = var.fnd_job_name
    rhrread_job_name    = var.rhrread_job_name
}

module "storage" {
    source              = "./modules/storage"
    bucket_location     = var.bucket_location
    fnd_bucket_name     = var.fnd_bucket_name
    gcf_bucket_name     = var.gcf_bucket_name
    rhrread_bucket_name = var.rhrread_bucket_name
}