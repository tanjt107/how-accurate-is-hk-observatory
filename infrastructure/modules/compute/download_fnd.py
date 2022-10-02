import boto3
import os
import requests
from datetime import datetime, timedelta

s3 = boto3.client("s3")
BUCKET_NAME = os.environ["BUCKET_NAME"]


def lambda_handler(event, context):
    res = requests.get(
        "https://data.weather.gov.hk/weatherAPI/opendata/weather.php",
        params={"dataType": "fnd", "lang": "tc"},
    )
    print(f"Status: {res.status_code}")
    hkt = datetime.now() + timedelta(hours=8)
    hkt = hkt.strftime("%Y-%m-%dT%H:%M")
    s3.put_object(
        Body=res.content,
        Bucket=BUCKET_NAME,
        Key=f"{hkt}.json",
    )
    return f"Successfully processed {hkt} snapshot."
