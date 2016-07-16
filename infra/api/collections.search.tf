resource "aws_api_gateway_method" "collections-search" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "GET"
  authorization = "NONE"
}

// LAMBDA INTEGRATION
resource "aws_api_gateway_integration" "collections-search-lambda" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-search.http_method}"
  type = "AWS"
  uri = "${aws_lambda_function.lambda-api.arn}"
}

// OK
resource "aws_api_gateway_method_response" "search-ok" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-search.http_method}"
  status_code = "200"
}

// Integration OK
resource "aws_api_gateway_integration_response" "search-ok-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-search.http_method}"
  status_code = "${aws_api_gateway_method_response.search-ok.status_code}"
}

// Bad request
resource "aws_api_gateway_method_response" "search-bad-request" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-search.http_method}"
  status_code = "400"
}

// Bad request integration
resource "aws_api_gateway_integration_response" "search-bad-request-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-search.http_method}"
  status_code = "${aws_api_gateway_method_response.search-bad-request.status_code}"
}

// Technical error
resource "aws_api_gateway_method_response" "search-unavailable" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-search.http_method}"
  status_code = "503"
}

// Technical error integration
resource "aws_api_gateway_integration_response" "search-unavailable-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  resource_id = "${aws_api_gateway_resource.collections.id}"
  http_method = "${aws_api_gateway_method.collections-search.http_method}"
  status_code = "${aws_api_gateway_method_response.search-unavailable.status_code}"
}
