from diagrams import Diagram
from diagrams.gcp.analytics import PubSub
from diagrams.gcp.compute import Functions
from diagrams.gcp.devtools import Scheduler
from diagrams.gcp.storage import Storage

with Diagram("How accurate is HK Observatory"):
    topic = PubSub("topic")
    extract = Functions("extract")
    (
        Scheduler("fnd")
        >> topic
        >> extract
        >> Storage("fnd")
        >> Functions("transform-forecast")
        >> Storage("forecast")
    )
    Scheduler("rhrread") >> topic >> extract >> Storage("rhrread")
