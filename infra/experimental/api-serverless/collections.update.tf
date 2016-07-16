resource "aws_api_gateway_method" "collections-update" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "GET"
  authorization = "NONE"
}

// LAMBDA INTEGRATION
resource "aws_api_gateway_integration" "collections-update-lambda" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-update.http_method}"
  type = "AWS"
  uri = "${aws_lambda_function.lambda-api.arn}"
}

// OK
resource "aws_api_gateway_method_response" "update-ok" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-update.http_method}"
  status_code = "200"
}

// Integration OK
resource "aws_api_gateway_integration_response" "update-ok-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-update.http_method}"
  status_code = "${aws_api_gateway_method_response.update-ok.status_code}"
}

// Bad request
resource "aws_api_gateway_method_response" "update-bad-request" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-update.http_method}"
  status_code = "400"
}

// Bad request integration
resource "aws_api_gateway_integration_response" "update-bad-request-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-update.http_method}"
  status_code = "${aws_api_gateway_method_response.update-bad-request.status_code}"
}

// Not found
resource "aws_api_gateway_method_response" "update-not-found" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-update.http_method}"
  status_code = "404"
}

// Not found integration
resource "aws_api_gateway_integration_response" "update-not-found-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-update.http_method}"
  status_code = "${aws_api_gateway_method_response.update-not-found.status_code}"
}

// Technical error
resource "aws_api_gateway_method_response" "update-unavailable" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-update.http_method}"
  status_code = "503"
}

// Technical error integration
resource "aws_api_gateway_integration_response" "update-unavailable-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-update.http_method}"
  status_code = "${aws_api_gateway_method_response.update-unavailable.status_code}"
}
