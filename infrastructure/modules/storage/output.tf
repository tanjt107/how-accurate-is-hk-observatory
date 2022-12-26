output "extract_zip_name" {
    value = google_storage_bucket_object.extact.name
}

output "forecast_zip_name" {
    value = google_storage_bucket_object.forecast.name
}