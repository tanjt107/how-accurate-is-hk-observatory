import functions_framework
import json
import os
from google.cloud import storage


def transform_forecast(content):
    records = json.loads(content)["weatherForecast"]
    for record in records:
        for field in (
            "forecastMaxtemp",
            "forecastMintemp",
            "forecastMaxrh",
            "forecastMinrh",
        ):
            record[field] = record[field]["value"]
    records = [json.dumps(record) for record in records]
    return "\n".join(records)


@functions_framework.cloud_event
def transform(cloud_event):
    data = cloud_event.data
    file_name = data["name"]

    storage_client = storage.Client()
    bucket_raw = storage_client.bucket(data["bucket"])
    blob_raw = bucket_raw.blob(file_name)

    content = blob_raw.download_as_string()
    content = transform_forecast(content)

    bucket_transformed = storage_client.bucket(os.environ["FORECAST_BUCKET_NAME"])
    blob_transformed = bucket_transformed.blob(file_name)
    blob_transformed.upload_from_string(content)
