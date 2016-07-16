resource "aws_api_gateway_method" "collections-get" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "GET"
  authorization = "NONE"
}

// LAMBDA INTEGRATION
resource "aws_api_gateway_integration" "collections-get-lambda" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-get.http_method}"
  type = "AWS"
  uri = "${aws_lambda_function.lambda-api.arn}"

  request_parameters_in_json = "${file("files/request.get.json")}"
}

// OK
resource "aws_api_gateway_method_response" "get-ok" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-get.http_method}"
  status_code = "200"
}

// Integration OK
resource "aws_api_gateway_integration_response" "get-ok-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-get.http_method}"
  status_code = "${aws_api_gateway_method_response.get-ok.status_code}"
}

// Bad request
resource "aws_api_gateway_method_response" "get-bad-request" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-get.http_method}"
  status_code = "400"
}

// Bad request integration
resource "aws_api_gateway_integration_response" "get-bad-request-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-get.http_method}"
  status_code = "${aws_api_gateway_method_response.get-bad-request.status_code}"
}

// Not found
resource "aws_api_gateway_method_response" "get-not-found" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-get.http_method}"
  status_code = "404"
}

// Not found integration
resource "aws_api_gateway_integration_response" "get-not-found-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-get.http_method}"
  status_code = "${aws_api_gateway_method_response.get-not-found.status_code}"
}

// Technical error
resource "aws_api_gateway_method_response" "get-unavailable" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-get.http_method}"
  status_code = "503"
}

// Technical error integration
resource "aws_api_gateway_integration_response" "get-unavailable-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections-one.id}"
  http_method = "${aws_api_gateway_method.collections-get.http_method}"
  status_code = "${aws_api_gateway_method_response.get-unavailable.status_code}"
}
