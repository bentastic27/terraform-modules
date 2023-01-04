provider "aws" {
  region = var.region
  shared_credentials_files = var.shared_credentials_files

  ignore_tags {
    key_prefixes = var.ignore_tags_key_prefixes
  }
}

module "eks-cluster" {
  providers = {
    aws = aws
  }
  source = "../../k8s/eks-basic"

  count = var.cluster_count
  region = var.region
  resource_name_prefix = "${var.resource_name_prefix}-${count.index}"
}

output "kubeconfig_commands" {
  description = "Commands to update your kubeconfig to access the EKS clusters"
  value = [
    for cluster in module.eks-cluster[*] :
    "aws eks update-kubeconfig --region ${cluster.region} --name ${cluster.name}"
  ]
}