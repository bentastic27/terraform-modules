terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.region
  shared_credentials_file = var.aws_credentials_file

  ignore_tags {
    keys = var.aws_ignore_tags_keys
    key_prefixes = var.aws_ignore_tags_keyprefixes
  }
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.resource_name_prefix}-eks-cluster"
  role_arn = aws_iam_role.eks_assume_role.arn

  version = var.eks_version

  vpc_config {
    subnet_ids = concat(aws_subnet.private_subnet[*].id, aws_subnet.public_subnet[*].id)
    endpoint_private_access = ! var.public_access
    endpoint_public_access = var.public_access
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]
}

resource "aws_eks_node_group" "ng" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.resource_name_prefix}-init-ng"
  node_role_arn   = aws_iam_role.eks_ec2_assume_role.arn

  # perhaps add another var to specify if the initial ng should be public or not
  subnet_ids      = var.public_access ? aws_subnet.public_subnet[*].id : aws_subnet.private_subnet[*].id

  instance_types = var.instance_types
  ami_type = var.ami_type
  disk_size = var.disk_size

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}