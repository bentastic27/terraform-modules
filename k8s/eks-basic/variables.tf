variable "region" {
  default = "us-west-2"
  type = string
}

variable "aws_credentials_file" {
  default = "~/.aws/credentials"
  type = string
}

variable "resource_name_prefix" {
  default = "example"
  type = string
}

variable "eks_version" {
  default = "1.23"
  type = string
}
