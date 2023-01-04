variable "region" {
  type = string
  default = "us-west-2"
  description = "AWS region to place EKS clusters in"  
}

variable "resource_name_prefix" {
  type = string
  default = "example"
  description = "AWS resource name prefix"
}

variable "cluster_count" {
  type = number
  default = 1
  description = "number of EKS clusters"
}

variable "shared_credentials_files" {
  type = list(string)
  default = [ "~/.aws/credentials" ]
  description = "list of paths to AWS credentials files"
}

variable "ignore_tags_key_prefixes" {
  type = list(string)
  default = []
  description = "tag key prefixes for Terraform to ignore. Useful for AutoTag and similar"
}