resource "aws_api_gateway_resource" "root-resource-public" {
  rest_api_id = "${aws_api_gateway_rest_api.chusrodriguez-api.id}"
  parent_id = "${aws_api_gateway_rest_api.chusrodriguez-api.root_resource_id}"
  path_part = "public"
}
