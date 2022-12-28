<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks-cluster"></a> [eks-cluster](#module\_eks-cluster) | ../../k8s/eks-basic | n/a |
| <a name="module_rancher"></a> [rancher](#module\_rancher) | ../../k8s/apps/rancher | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_credentials_file"></a> [aws\_credentials\_file](#input\_aws\_credentials\_file) | path to your AWS credentials file | `string` | `"~/.aws/credentials"` | no |
| <a name="input_rancher_bootstrap_password"></a> [rancher\_bootstrap\_password](#input\_rancher\_bootstrap\_password) | password to login to Rancher. Default is someStrongPassword | `string` | n/a | yes |
| <a name="input_rancher_hostname"></a> [rancher\_hostname](#input\_rancher\_hostname) | hostname of your Rancher installation, you will need to point this to the created AWS LB | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | aws region | `string` | `"us-west-2"` | no |
| <a name="input_resource_name_prefix"></a> [resource\_name\_prefix](#input\_resource\_name\_prefix) | The prefix for the Name tag of all created AWS resources | `string` | `"example"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rancher_ingress"></a> [rancher\_ingress](#output\_rancher\_ingress) | Point the Rancher hostname to this hostname or IP |
| <a name="output_rancher_url"></a> [rancher\_url](#output\_rancher\_url) | URL/hostname for Rancher |
<!-- END_TF_DOCS -->