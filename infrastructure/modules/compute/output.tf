output "fnd_lambda_arn" {
    value = aws_lambda_function.download_fnd.arn
}

output "rhrread_lambda_arn" {
    value = aws_lambda_function.download_rhrread.arn
}

output "fnd_function_name" {
    value = aws_lambda_function.download_fnd.function_name
}

output "rhrread_function_name" {
    value = aws_lambda_function.download_rhrread.function_name
}