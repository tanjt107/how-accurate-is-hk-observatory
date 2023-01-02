resource "google_bigquery_dataset" "main" {
  dataset_id                 = var.dataset_id
  description                = var.description
  location                   = var.location
  delete_contents_on_destroy = var.delete_contents_on_destroy
}

resource "google_bigquery_dataset_access" "main" {
  dataset_id = google_bigquery_dataset.main.dataset_id
  role       = "READER"
  iam_member = "allUsers"
}