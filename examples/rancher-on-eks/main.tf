
variable "resource_name_prefix" {
  default = "example"
  type = string
  description = "The prefix for the Name tag of all created AWS resources"
}

variable "region" {
  default = "us-west-2"
  type = string
  description = "aws region"
}

variable "aws_credentials_file" {
  default = "~/.aws/credentials"
  type = string
  description = "path to your AWS credentials file"
}

variable "rancher_hostname" {
  type = string
  description = "hostname of your Rancher installation, you will need to point this to the created AWS LB"
}

variable "rancher_bootstrap_password" {
  type = string
  description = "password to login to Rancher. Default is someStrongPassword"
}

module "eks-cluster" {
  source = "../../k8s/eks-basic"

  region = var.region
  aws_credentials_file = var.aws_credentials_file
  resource_name_prefix = var.resource_name_prefix
  aws_ignore_tags_keyprefixes = [ "AutoTag" ]
}

module "rancher" {
  source = "../../k8s/apps/rancher"

  eks_cluster = true
  eks_cluster_region = var.region
  eks_cluster_name = module.eks-cluster.cluster-name

  cluster_endpoint = module.eks-cluster.endpoint
  cluster_ca_cert = module.eks-cluster.kubeconfig-certificate-authority-data

  rancher_hostname = var.rancher_hostname
  rancher_bootstrap_password = var.rancher_bootstrap_password
}

output "rancher_ingress" {
  value = module.rancher.ingress_address
  description = "Point the Rancher hostname to this hostname or IP"
}

output "rancher_url" {
  value = module.rancher.rancher_url
  description = "URL/hostname for Rancher"
}