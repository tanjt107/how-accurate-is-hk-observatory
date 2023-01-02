from diagrams import Cluster, Diagram
from diagrams.gcp.analytics import Bigquery, Pubsub
from diagrams.gcp.compute import Functions
from diagrams.gcp.devtools import Scheduler
from diagrams.gcp.storage import Storage
from diagrams.onprem.analytics import Tableau

with Diagram("How accurate is HK Observatory"):
    extract = Functions("extract")
    [Scheduler("fnd"), Scheduler("rhrread")] >> Pubsub() >> extract

    load = Functions("load")
    (
        extract
        >> Storage("fnd")
        >> Functions("transform-fnd")
        >> Storage("forecast")
        >> load
    )

    rhrread = Storage("rhrread")
    (
        extract
        >> rhrread
        >> Functions("transform-temperature")
        >> Storage("temperature")
        >> load
    )
    (rhrread >> Functions("transform-rainfall") >> Storage("rainfall") >> load)

    with Cluster():
        tables = [
            Bigquery("forecast"),
            Bigquery("temperature"),
            Bigquery("rainfall"),
        ]

    load >> tables >> Tableau()
