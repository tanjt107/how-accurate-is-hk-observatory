output "dataset_id" {
  value       = "${google_bigquery_dataset.main.project}.${google_bigquery_dataset.main.dataset_id}"
  description = "The ID of the dataset, with the project name."
}