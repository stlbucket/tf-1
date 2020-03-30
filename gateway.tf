# https://www.terraform.io/docs/providers/aws/d/api_gateway_rest_api.html
resource "aws_api_gateway_rest_api" "chc" {
  name = "chc"
}

# https://www.terraform.io/docs/providers/aws/r/api_gateway_resource.html
resource "aws_api_gateway_resource" "resource" {
  path_part   = "lscm"
  parent_id   = "${aws_api_gateway_rest_api.chc.root_resource_id}"
  rest_api_id = "${aws_api_gateway_rest_api.chc.id}"
}

# https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html
resource "aws_api_gateway_method" "method" {
  rest_api_id   = "${aws_api_gateway_rest_api.chc.id}"
  resource_id   = "${aws_api_gateway_resource.resource.id}"
  http_method   = "POST"
  authorization = "NONE"

  // https://medium.com/onfido-tech/aws-api-gateway-with-terraform-7a2bebe8b68f
  # request_parameters = {
  #   "method.request.path.proxy" = true
  # }
  # # request_parameters = {"method.request.body.fasta_ids" = true}
}

# https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html
# resource "aws_api_gateway_integration" "integration" {
#   rest_api_id             = "${aws_api_gateway_rest_api.chc.id}"
#   resource_id             = "${aws_api_gateway_resource.resource.id}"
#   http_method             = "${aws_api_gateway_method.method.http_method}"
#   integration_http_method = "POST"
#   type                    = "HTTP_PROXY"
#   uri                     = "https://${aws_api_gateway_rest_api.chc.id}.execute-api.${var.myregion}.amazonaws.com/lcsm"
#   # request_parameters =  {
#   #   "integration.request.path.proxy" = "method.request.path.proxy"
#   # }
#   # # request_parameters      = { "integration.request.body.fasta_ids" = "method.request.body.fasta_ids" }
# }


# model is not part of original reference
# https://www.terraform.io/docs/providers/aws/r/api_gateway_model.html
# resource "aws_api_gateway_model" "lscm_model" {
#   rest_api_id  = "${aws_api_gateway_rest_api.chc.id}"
#   name         = "lscm_payload"
#   description  = "required parameters for lcsm shared motif discovery"
#   content_type = "application/json"

#   schema = <<EOF
# {
#   "type": "object"
# }
# EOF
# }
