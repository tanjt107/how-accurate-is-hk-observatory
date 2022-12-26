from diagrams import Diagram
from diagrams.gcp.analytics import PubSub
from diagrams.gcp.compute import Functions
from diagrams.gcp.devtools import Scheduler
from diagrams.gcp.storage import Storage

with Diagram("How accurate is HK Observatory"):
    extract = (
        [Scheduler("fnd"), Scheduler("rhrread")]
        >> PubSub("topic")
        >> Functions("extract")
    )
    (extract >> Storage("fnd") >> Functions("transform-fnd") >> Storage("forecast"))
    (
        extract
        >> Storage("rhrread")
        >> Functions("transform-rhrread")
        >> [Storage("rainfall"), Storage("temperature")]
    )
