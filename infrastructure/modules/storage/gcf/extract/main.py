import functions_framework
import os
import requests
from google.cloud import storage


@functions_framework.cloud_event
def extract(cloud_event: dict):
    """Makes HTTP get request to HKO API and uploads the response to the bucket."""
    bucket_names = {
        "fnd": os.environ["FND_BUCKET_NAME"],
        "rhrread": os.environ["RHRREAD_BUCKET_NAME"],
    }
    endpoint = cloud_event.data["message"]["attributes"]["endpoint"]
    response = requests.get(
        "https://data.weather.gov.hk/weatherAPI/opendata/weather.php",
        params={"dataType": endpoint, "lang": "en"},
    )
    storage_client = storage.Client()
    bucket = storage_client.bucket(bucket_names[endpoint])
    file_name = f"{response.json()['updateTime']}.json"
    blob = bucket.blob(file_name)
    blob.upload_from_string(response.content)
