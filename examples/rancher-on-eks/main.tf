
locals {
  resource_name_prefix = "ben-tf-test"
  region = "us-west-2"
  aws_credentials_file = "~/.aws/credentials"
  rancher_hostname = "rancher.example.com"
}

module "eks-cluster" {
  source = "../../k8s/eks-basic"

  region = local.region
  aws_credentials_file = local.aws_credentials_file
  resource_name_prefix = local.resource_name_prefix
  aws_ignore_tags_keyprefixes = [ "AutoTag" ]
}

module "rancher" {
  source = "../../k8s/apps/rancher"

  eks_cluster = true
  eks_cluster_region = local.region
  eks_cluster_name = module.eks-cluster.cluster-name

  cluster_endpoint = module.eks-cluster.endpoint
  cluster_ca_cert = module.eks-cluster.kubeconfig-certificate-authority-data

  rancher_hostname = local.rancher_hostname
}
