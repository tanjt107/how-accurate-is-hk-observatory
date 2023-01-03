resource "google_bigquery_dataset" "this" {
  dataset_id                 = var.dataset_id
  description                = var.description
  location                   = var.location
  project                    = var.project_id
  delete_contents_on_destroy = var.delete_contents_on_destroy
}

resource "google_bigquery_dataset_access" "this" {
  dataset_id = google_bigquery_dataset.this.dataset_id
  role       = "READER"
  iam_member = "allUsers"
  project    = var.project_id
}