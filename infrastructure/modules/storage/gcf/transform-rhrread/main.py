import functions_framework
import json
import os
from google.cloud import storage


def transform_rainfall(rhrread_str):
    rainfall = json.loads(rhrread_str)["rainfall"]
    start_time = rainfall["startTime"]
    end_time = rainfall["endTime"]
    # start_time = rainfall["startTime"][:-6]
    # end_time = rainfall["endTime"][:-6]
    data = rainfall["data"]
    for datum in data:
        datum["startTime"] = start_time
        datum["endTime"] = end_time
    data = [json.dumps(datum) for datum in data]
    return "\n".join(data)


def transform_temperature(rhrread_str):
    temperature = json.loads(rhrread_str)["temperature"]
    record_time = temperature["recordTime"]
    # record_time = temperature["recordTime"][:-6]
    data = temperature["data"]
    for datum in data:
        datum["recordTime"] = record_time
    data = [json.dumps(datum) for datum in data]
    return "\n".join(data)


@functions_framework.cloud_event
def transform_rhrread(cloud_event):
    data = cloud_event.data
    file_name = data["name"]

    storage_client = storage.Client()
    bucket_raw = storage_client.bucket(data["bucket"])
    blob_raw = bucket_raw.blob(file_name)
    content = blob_raw.download_as_string()

    rainfall = transform_rainfall(content)
    bucket_transformed = storage_client.bucket(os.environ["RAINFALL_BUCKET_NAME"])
    blob_transformed = bucket_transformed.blob(file_name)
    blob_transformed.upload_from_string(rainfall)

    temperature = transform_temperature(content)
    bucket_transformed = storage_client.bucket(os.environ["TEMPERATURE_BUCKET_NAME"])
    blob_transformed = bucket_transformed.blob(file_name)
    blob_transformed.upload_from_string(temperature)
