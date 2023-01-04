provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]

  ignore_tags {
    key_prefixes = [ "AutoTag" ]
  }
}

module "eks-cluster" {
  providers = {
    aws = aws
  }
  source = "../../k8s/eks-basic"

  count = 2
  region = "us-west-2"
  resource_name_prefix = "ben-tf-${count.index}"
}

output "kubeconfig" {
  value = [
    for cluster in module.eks-cluster[*] :
    "aws eks update-kubeconfig --region ${cluster.region} --name ${cluster.name}"
  ]
}