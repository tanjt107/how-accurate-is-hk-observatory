from diagrams import Diagram
from diagrams.gcp.analytics import PubSub
from diagrams.gcp.compute import Functions
from diagrams.gcp.devtools import Scheduler
from diagrams.gcp.storage import Storage

with Diagram("How accurate is HK Observatory"):
    pubsub = PubSub("hko-topic")
    func = Functions("download-hko")
    Scheduler("hko-fnd") >> pubsub >> func >> Storage("hko-fnd")
    Scheduler("hko-rhrread") >> pubsub >> func >> Storage("hko-rhrread")
