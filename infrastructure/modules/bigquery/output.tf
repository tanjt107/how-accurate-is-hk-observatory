output "dataset_id" {
  value       = "${google_bigquery_dataset.this.project}.${google_bigquery_dataset.this.dataset_id}"
  description = "The ID of the dataset, with the project name."
}