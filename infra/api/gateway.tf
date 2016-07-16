resource "aws_api_gateway_rest_api" "chusrodriguez-api" {
  name = "chusrodriguez-api-${var.environment}"
  description = "This is my API for demonstration purposes"
}
