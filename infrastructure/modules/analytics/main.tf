resource "google_bigquery_dataset" "this" {
  dataset_id  = "hko"
  description = "Hong Kong Observatory Open Data."
  location    = var.location
}

resource "google_bigquery_dataset_access" "this" {
  dataset_id = google_bigquery_dataset.this.dataset_id
  role       = "roles/bigquery.dataViewer"
  iam_member = "allUsers"
}