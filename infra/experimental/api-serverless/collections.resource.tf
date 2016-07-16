// Global resource
resource "aws_api_gateway_resource" "collections" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  parent_id = "${aws_api_gateway_resource.root-resource-public.id}"
  path_part = "${var.collections_path_part}"
}

// Local resource
resource "aws_api_gateway_resource" "collections-one" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  parent_id = "${aws_api_gateway_resource.collections.id}"
  path_part = "{id}"
}
