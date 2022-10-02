module "compute" {
    source = "./modules/compute"
    fnd_bucket_name = module.storage.fnd_bucket_name
    rhrread_bucket_name = module.storage.rhrread_bucket_name
}

module "storage" {
    source = "./modules/storage"
}

module "integration" {
    source = "./modules/integration"
    fnd_lambda_arn = module.compute.fnd_lambda_arn
    rhrread_lambda_arn = module.compute.rhrread_lambda_arn
    fnd_function_name = module.compute.fnd_function_name
    rhrread_function_name = module.compute.rhrread_function_name
}