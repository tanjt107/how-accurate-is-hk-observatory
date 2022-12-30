output "fnd_bucket_name" {
  value       = google_storage_bucket.fnd.name
  description = "The bucket name of 9-day Weather Forecast (fnd) data bucket."
}

output "rhrread_bucket_name" {
  value       = google_storage_bucket.rhrread.name
  description = "The bucket name of Current Weather Report (rhrread) data bucket."
}

output "forecast_bucket_name" {
  value       = google_storage_bucket.forecast.name
  description = "The bucket name of Weather Forecast data bucket."
}

output "rainfall_bucket_name" {
  value       = google_storage_bucket.rainfall.name
  description = "The bucket name of Rainfall Forecast data bucket."
}

output "temperature_bucket_name" {
  value       = google_storage_bucket.temperature.name
  description = "The bucket name of Temperature Forecast data bucket."
}