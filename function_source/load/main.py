import functions_framework
import os
from google.cloud import bigquery


@functions_framework.cloud_event
def load(cloud_event):
    data = cloud_event.data
    client = bigquery.Client()

    job_config = bigquery.LoadJobConfig(
        autodetect=True,
        source_format=bigquery.SourceFormat.NEWLINE_DELIMITED_JSON,
    )

    load_job = client.load_table_from_uri(
        f"gs://{data['bucket']}/{data['name']}",
        os.environ["DESTINATION"],
        job_config=job_config,
    )

    load_job.result()
