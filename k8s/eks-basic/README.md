<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.48.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.ngw_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eks_addon.ebs_addon](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.ng](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_ec2_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.AmazonEBSCSIDriverPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSVPCResourceController](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.ngw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_subnet_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_subnet_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_rta](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_rta](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.az_list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_eks_addon_version.latest_ebs_addon_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_addon_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | n/a | `string` | `"AL2_x86_64"` | no |
| <a name="input_aws_credentials_file"></a> [aws\_credentials\_file](#input\_aws\_credentials\_file) | n/a | `string` | `"~/.aws/credentials"` | no |
| <a name="input_aws_ignore_tags_keyprefixes"></a> [aws\_ignore\_tags\_keyprefixes](#input\_aws\_ignore\_tags\_keyprefixes) | n/a | `list(string)` | `[]` | no |
| <a name="input_aws_ignore_tags_keys"></a> [aws\_ignore\_tags\_keys](#input\_aws\_ignore\_tags\_keys) | n/a | `list(string)` | `[]` | no |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | n/a | `number` | `3` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | n/a | `number` | `50` | no |
| <a name="input_ebs_addon_version"></a> [ebs\_addon\_version](#input\_ebs\_addon\_version) | n/a | `string` | `"latest"` | no |
| <a name="input_eks_public_access"></a> [eks\_public\_access](#input\_eks\_public\_access) | n/a | `bool` | `true` | no |
| <a name="input_eks_version"></a> [eks\_version](#input\_eks\_version) | n/a | `string` | `"1.23"` | no |
| <a name="input_enable_ebs_addon"></a> [enable\_ebs\_addon](#input\_enable\_ebs\_addon) | n/a | `bool` | `true` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | n/a | `list(string)` | <pre>[<br>  "t2.xlarge"<br>]</pre> | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | n/a | `number` | `6` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | n/a | `number` | `1` | no |
| <a name="input_ng_public_access"></a> [ng\_public\_access](#input\_ng\_public\_access) | n/a | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-west-2"` | no |
| <a name="input_resource_name_prefix"></a> [resource\_name\_prefix](#input\_resource\_name\_prefix) | n/a | `string` | `"example"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster-name"></a> [cluster-name](#output\_cluster-name) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_kubeconfig-certificate-authority-data"></a> [kubeconfig-certificate-authority-data](#output\_kubeconfig-certificate-authority-data) | n/a |
<!-- END_TF_DOCS -->