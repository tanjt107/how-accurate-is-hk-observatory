import functions_framework
import json
import os
from google.cloud import storage


def transform_forecast(fnd_str):
    fnd_dict = json.loads(fnd_str)
    update_time = fnd_dict["updateTime"][:-6]
    forecasts = fnd_dict["weatherForecast"]
    for forecast in forecasts:
        forecast[
            "forecastDate"
        ] = f"{forecast['forecastDate'][:4]}-{forecast['forecastDate'][4:6]}-{forecast['forecastDate'][6:8]}"
        for param in (
            "forecastMaxtemp",
            "forecastMintemp",
            "forecastMaxrh",
            "forecastMinrh",
        ):
            forecast[param] = forecast[param]["value"]
        forecast["updateTime"] = update_time

    forecasts = [json.dumps(forecast) for forecast in forecasts]
    return "\n".join(forecasts)


@functions_framework.cloud_event
def transform_fnd(cloud_event):
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
