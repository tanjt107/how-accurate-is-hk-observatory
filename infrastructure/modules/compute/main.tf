resource "aws_iam_role" "lambda_role" {
    name = "LambdaRole"
    assume_role_policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "lambda.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    })
}

# data "aws_iam_policy" "AmazonSQSFullAccess" {
#     arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
# }

# resource "aws_iam_role_policy_attachment" "sqs-attach" {
#   role       = aws_iam_role.lambda_role.name
#   policy_arn = data.aws_iam_policy.AmazonSQSFullAccess.arn
# }

data "aws_iam_policy" "AmazonS3FullAccess" {
    arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "s3-attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = data.aws_iam_policy.AmazonS3FullAccess.arn
}

data "aws_iam_policy" "AWSLambdaBasicExecutionRole" {
    arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "lambda-attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = data.aws_iam_policy.AWSLambdaBasicExecutionRole.arn
}

resource "aws_lambda_layer_version" "request_layer" {
    filename = "./modules/compute/requests.zip"
    layer_name = "RequestLayer"
    
    compatible_runtimes = ["python3.9"]

}

resource "aws_lambda_function" "download_fnd" {
    filename = "./modules/compute/download_fnd.zip"
    function_name = "DownloadFnD"
    role = aws_iam_role.lambda_role.arn
    handler = "download_fnd.lambda_handler"
    runtime = "python3.9"
    layers = [aws_lambda_layer_version.request_layer.arn]
    timeout = 10

    environment {
        variables =  {
          BUCKET_NAME = var.fnd_bucket_name
        }
    }
}

resource "aws_lambda_function" "download_rhrread" {
    filename = "./modules/compute/download_rhrread.zip"
    function_name = "DownloadrhrRead"
    role = aws_iam_role.lambda_role.arn
    handler = "download_rhrread.lambda_handler"
    runtime = "python3.9"
    layers = [aws_lambda_layer_version.request_layer.arn]
    timeout = 10

    environment {
        variables =  {
          BUCKET_NAME = var.rhrread_bucket_name
        }
    }
}