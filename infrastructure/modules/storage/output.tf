output "fnd_bucket_name" {
    value = aws_s3_bucket.fnd.id
}

output "rhrread_bucket_name" {
    value = aws_s3_bucket.rhrread.id
}
