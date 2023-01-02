import functions_framework
import json
import os
from google.cloud import storage


def transform(rhrread_str):
    temperature = json.loads(rhrread_str)["temperature"]
    record_time = temperature["recordTime"]
    data = temperature["data"]
    for datum in data:
        datum["recordTime"] = record_time
    data = [json.dumps(datum) for datum in data]
    return "\n".join(data)


@functions_framework.cloud_event
def transform_temperature(cloud_event):
    data = cloud_event.data
    file_name = data["name"]

    storage_client = storage.Client()
    bucket_raw = storage_client.bucket(data["bucket"])
    blob_raw = bucket_raw.blob(file_name)
    content = blob_raw.download_as_string()

    temperature = transform(content)
    bucket_transformed = storage_client.bucket(os.environ["BUCKET_NAME"])
    blob_transformed = bucket_transformed.blob(file_name)
    blob_transformed.upload_from_string(temperature)
