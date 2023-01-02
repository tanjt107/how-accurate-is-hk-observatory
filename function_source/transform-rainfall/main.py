import functions_framework
import json
import os
from google.cloud import storage


def transform(rhrread_str):
    rainfall = json.loads(rhrread_str)["rainfall"]
    start_time = rainfall["startTime"]
    end_time = rainfall["endTime"]
    data = rainfall["data"]
    for datum in data:
        datum["startTime"] = start_time
        datum["endTime"] = end_time
    data = [json.dumps(datum) for datum in data]
    return "\n".join(data)


@functions_framework.cloud_event
def transform_rainfall(cloud_event):
    data = cloud_event.data
    file_name = data["name"]

    storage_client = storage.Client()
    bucket_raw = storage_client.bucket(data["bucket"])
    blob_raw = bucket_raw.blob(file_name)

    content = blob_raw.download_as_string()
    rainfall = transform(content)

    bucket_transformed = storage_client.bucket(os.environ["BUCKET_NAME"])
    blob_transformed = bucket_transformed.blob(file_name)
    blob_transformed.upload_from_string(rainfall)
