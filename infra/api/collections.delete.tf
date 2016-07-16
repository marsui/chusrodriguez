resource "aws_api_gateway_method" "collections-delete" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "GET"
  authorization = "NONE"
}

// LAMBDA INTEGRATION
resource "aws_api_gateway_integration" "collections-delete-lambda" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-delete.http_method}"
  type = "AWS"
  uri = "${aws_lambda_function.lambda-api.arn}"
}

// OK
resource "aws_api_gateway_method_response" "delete-ok" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-delete.http_method}"
  status_code = "209"
}

// Integration OK
resource "aws_api_gateway_integration_response" "delete-ok-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-delete.http_method}"
  status_code = "${aws_api_gateway_method_response.delete-ok.status_code}"
}

// Bad request
resource "aws_api_gateway_method_response" "delete-bad-request" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-delete.http_method}"
  status_code = "400"
}

// Bad request integration
resource "aws_api_gateway_integration_response" "delete-bad-request-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-delete.http_method}"
  status_code = "${aws_api_gateway_method_response.delete-bad-request.status_code}"
}

// Not found
resource "aws_api_gateway_method_response" "delete-not-found" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-delete.http_method}"
  status_code = "404"
}

// Not found integration
resource "aws_api_gateway_integration_response" "delete-not-found-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-delete.http_method}"
  status_code = "${aws_api_gateway_method_response.delete-not-found.status_code}"
}

// Technical error
resource "aws_api_gateway_method_response" "delete-unavailable" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-delete.http_method}"
  status_code = "503"
}

// Technical error integration
resource "aws_api_gateway_integration_response" "delete-unavailable-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-delete.http_method}"
  status_code = "${aws_api_gateway_method_response.delete-unavailable.status_code}"
}
