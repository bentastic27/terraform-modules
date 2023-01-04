<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks-cluster"></a> [eks-cluster](#module\_eks-cluster) | ../../k8s/eks-basic | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_count"></a> [cluster\_count](#input\_cluster\_count) | number of EKS clusters | `number` | `1` | no |
| <a name="input_ignore_tags_key_prefixes"></a> [ignore\_tags\_key\_prefixes](#input\_ignore\_tags\_key\_prefixes) | tag key prefixes for Terraform to ignore. Useful for AutoTag and similar | `list(string)` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region to place EKS clusters in | `string` | `"us-west-2"` | no |
| <a name="input_resource_name_prefix"></a> [resource\_name\_prefix](#input\_resource\_name\_prefix) | AWS resource name prefix | `string` | `"example"` | no |
| <a name="input_shared_credentials_files"></a> [shared\_credentials\_files](#input\_shared\_credentials\_files) | list of paths to AWS credentials files | `list(string)` | <pre>[<br>  "~/.aws/credentials"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeconfig_commands"></a> [kubeconfig\_commands](#output\_kubeconfig\_commands) | Commands to update your kubeconfig to access the EKS clusters |
<!-- END_TF_DOCS -->