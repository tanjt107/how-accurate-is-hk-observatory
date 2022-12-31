module "analytics" {
  source   = "./modules/analytics"
  location = var.region
}

module "compute" {
  source       = "./modules/compute"
  location     = var.region
  pubsub_topic = module.devtools.topic_id
  dataset_id   = module.analytics.dataset_id
  bucket_names = module.storage.bucket_names
}

module "devtools" {
  source       = "./modules/devtools"
  bucket_names = module.storage.bucket_names
}

module "storage" {
  source   = "./modules/storage"
  location = var.region
}