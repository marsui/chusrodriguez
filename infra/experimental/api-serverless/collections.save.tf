resource "aws_api_gateway_method" "collections-save" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "POST"
  authorization = "NONE"
}

// LAMBDA INTEGRATION
resource "aws_api_gateway_integration" "collections-save-lambda" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-save.http_method}"
  type = "AWS"
  uri = "${aws_lambda_function.lambda-api.arn}"
}

// OK
resource "aws_api_gateway_method_response" "save-ok" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-save.http_method}"
  status_code = "201"
}

// Integration OK
resource "aws_api_gateway_integration_response" "save-ok-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-save.http_method}"
  status_code = "${aws_api_gateway_method_response.save-ok.status_code}"
}

// Bad request
resource "aws_api_gateway_method_response" "save-bad-request" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-save.http_method}"
  status_code = "400"
}

// Bad request integration
resource "aws_api_gateway_integration_response" "save-bad-request-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-save.http_method}"
  status_code = "${aws_api_gateway_method_response.save-bad-request.status_code}"
}

// Duplicated key
resource "aws_api_gateway_method_response" "save-duplicated" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-save.http_method}"
  status_code = "409"
}

// Duplicated key integration
resource "aws_api_gateway_integration_response" "save-duplicated-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-save.http_method}"
  status_code = "${aws_api_gateway_method_response.save-duplicated.status_code}"
}

// Technical error
resource "aws_api_gateway_method_response" "save-unavailable" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-save.http_method}"
  status_code = "503"
}

// Technical error integration
resource "aws_api_gateway_integration_response" "save-unavailable-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-save.http_method}"
  status_code = "${aws_api_gateway_method_response.save-unavailable.status_code}"
}
