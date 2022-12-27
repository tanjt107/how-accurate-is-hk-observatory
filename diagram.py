from diagrams import Diagram
from diagrams.gcp.analytics import Bigquery, Pubsub
from diagrams.gcp.compute import Functions
from diagrams.gcp.devtools import Scheduler
from diagrams.gcp.storage import Storage

with Diagram("How accurate is HK Observatory"):
    extract = Functions("extract")
    load = Functions("load")

    [Scheduler("fnd"), Scheduler("rhrread")] >> Pubsub("topic") >> extract

    (
        extract
        >> Storage("fnd")
        >> Functions("transform-fnd")
        >> Storage("forecast")
        >> load
    )
    (
        extract
        >> Storage("rhrread")
        >> Functions("transform-rhrread")
        >> [Storage("temperature"), Storage("rainfall")]
        >> load
    )

    load >> [
        Bigquery("forecast"),
        Bigquery("temperature"),
        Bigquery("rainfall"),
    ]
