from sched import scheduler
from diagrams import Diagram
from diagrams.aws.compute import Lambda
from diagrams.aws.integration import Eventbridge
from diagrams.aws.storage import S3

with Diagram("HKO Web Scraping"):
    schedule = Eventbridge("EveryHour")
    schedule >> Lambda("DownloadFnd") >> S3("hko-fnd")
    schedule >> Lambda("DownloadrhrRead") >> S3("hko-rhrread")
