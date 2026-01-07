
resource "aws_iam_role" "test_role" {
  name = "lambda_eventbridge_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "policy-attached" {
    role = aws_iam_role.test_role.id
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  
}

resource "aws_lambda_function" "lambda_event" {
    function_name = "event_lambda"
    runtime = "python3.14"
    timeout = 900
    handler = "lambda_function.lambda_handler"
    role = aws_iam_role.test_role.arn
    filename = "lambda_function.zip"
    memory_size = 128
  
}

resource "aws_cloudwatch_event_rule" "every-ten-minutes" {
    name = "every-ten-minutes"

    description = "Trigger Lambda every 10 minutes"
    
    #   schedule_expression = "rate(5 minutes)"
    schedule_expression = "cron(0/10 * * * ? *)"
}

# 5️⃣ Add the Lambda target
resource "aws_cloudwatch_event_target" "invoke_lambda" {
    rule = aws_cloudwatch_event_rule.every-ten-minutes.id
    target_id = "lambda"
     arn       = aws_lambda_function.lambda_event.arn
  
}

# 6️⃣ Allow EventBridge to invoke the Lambda
resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_event.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.every-ten-minutes.arn
}