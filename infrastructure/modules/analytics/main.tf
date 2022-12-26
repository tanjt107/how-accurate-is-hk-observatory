resource "google_bigquery_dataset" "dataset" {
    dataset_id                 = "hko"
    delete_contents_on_destroy = true
}

resource "google_bigquery_table" "forecast" {
    dataset_id          = google_bigquery_dataset.dataset.dataset_id
    table_id            = "forecast"
    location            = var.location
    schema              = <<EOF
[
  {
    "name": "forecastDate",
    "type": "DATE",
    "mode": "REQUIRED",
    "description": "Forecast Date"
  },
  {
    "name": "week",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Week"
  },
  {
    "name": "forecastWind",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Forecast Wind"
  },
  {
    "name": "forecastWeather",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Forecast Weather"
  },
  {
    "name": "forecastMaxtemp",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "Forecast Maximum Temperature"
  },
  {
    "name": "forecastMintemp",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "Forecast Minimum Temperature"
  },
  {
    "name": "forecastMaxrh",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "Forecast Maximum Relative Humidity"
  },
  {
    "name": "forecastMinrh",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "Forecast Minimum Relative Humidity"
  },
  {
    "name": "ForecastIcon",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "Forecast Weather Icon"
  },
  {
    "name": "PSR",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Probability of Significant Rain"
  }
]
EOF
    deletion_protection = false
}

resource "google_pubsub_topic" "topic" {
    name = var.pubsub_topic_name
}