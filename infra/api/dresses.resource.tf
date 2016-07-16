resource "aws_api_gateway_resource" "collections" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  parent_id = "${aws_api_gateway_rest_api.chusrodriguez-api.root_resource_id}"
  path_part = "${var.dresses_path_part}"
}
