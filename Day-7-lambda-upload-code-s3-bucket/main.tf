resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "gani-07"
}

resource "aws_s3_object" "zip_file" {
  bucket = aws_s3_bucket.lambda_bucket.id
  key = "lambda/lambda_function.zip"
  source = "lambda_function.zip"

  etag = filemd5 ("lambda_function.zip")

}

resource "aws_iam_role" "test_role" {
  name = "lambda_s3_execution_role"

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

resource "aws_lambda_function" "lambda_bucket" {
    function_name = "s3_lambda"
    runtime = "python3.14"
    timeout = 900
    handler = "lambda_function.lambda_handler"
    role = aws_iam_role.test_role.arn
    filename = "lambda_function.zip"
    memory_size = 128
  
}