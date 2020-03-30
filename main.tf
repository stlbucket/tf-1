provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

# Variables
variable "myregion" {
  default = "us-west-2"
}

variable "accountId" {
  default = "708012319661"
}

# general design reference
# https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#lambda-integration
