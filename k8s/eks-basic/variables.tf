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

variable "instance_types" {
  default = ["t2.xlarge"]
  type = list(string)
}

variable "ami_type" {
  # https://docs.aws.amazon.com/eks/latest/APIReference/API_Nodegroup.html#AmazonEKS-Type-Nodegroup-amiType
  default = "AL2_x86_64"
  type = string
}

variable "eks_public_access" {
  default = true
  type = bool
}

variable "ng_public_access" {
  default = true
  type = bool
}

variable "min_size" {
  default = 1
  type = number
}

variable "max_size" {
  default = 6
  type = number
}

variable "desired_size" {
  default = 3
  type = number
}

variable "disk_size" {
  default = 50
  type = number
}

variable "aws_ignore_tags_keys" {
  default = []
  type = list(string)
}

variable "aws_ignore_tags_keyprefixes" {
  default = []
  type = list(string)
}

variable "enable_ebs_addon" {
  default = true
  type = bool
}

variable "ebs_addon_version" {
  default = "latest"
  type = string  
}