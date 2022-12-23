import requests
from datetime import datetime, timedelta
from google.cloud import storage


def get_hko_data(event: dict, context: dict):
    """Makes HTTP get request to HKO API and uploads the response to the bucket."""
    attributes = event["attributes"]
    response = requests.get(
        "https://data.weather.gov.hk/weatherAPI/opendata/weather.php",
        params={"dataType": attributes["endpoint"], "lang": "en"},
    )
    storage_client = storage.Client()
    bucket = storage_client.bucket(attributes["bucket_name"])
    hkt = datetime.now() + timedelta(hours=8)
    file_name = f"{hkt.isoformat(timespec='minutes')}.json"
    blob = bucket.blob(file_name)
    blob.upload_from_string(response.content)
    return f"{file_name} uploaded to {bucket}"