resource "aws_cloudwatch_event_rule" "Minute0" {
    name = "Minute0"
    schedule_expression = "cron(0 * * * ? *)"
}

resource "aws_cloudwatch_event_target" "fnd" {
    rule = aws_cloudwatch_event_rule.Minute0.name
    target_id = "Fnd"
    arn = var.fnd_lambda_arn
}

resource "aws_cloudwatch_event_target" "rhrRead" {
    rule = aws_cloudwatch_event_rule.Minute0.name
    target_id = "rhrRead"
    arn = var.rhrread_lambda_arn
}

resource "aws_lambda_permission" "cloudwatch_to_lambda_fnd" {
  statement_id = "AllowExecutionFromCloudWatch"
  action = "lambda:InvokeFunction"
  function_name = var.fnd_function_name
  principal = "events.amazonaws.com"
  source_arn = aws_cloudwatch_event_rule.Minute0.arn
}

resource "aws_lambda_permission" "cloudwatch_to_lambda_rhrread" {
  statement_id = "AllowExecutionFromCloudWatch"
  action = "lambda:InvokeFunction"
  function_name = var.rhrread_function_name
  principal = "events.amazonaws.com"
  source_arn = aws_cloudwatch_event_rule.Minute0.arn
}