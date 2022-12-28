Requires ansible (`brew install ansible`) and kubernetes.core and community.general modules (`ansible-galaxy collection install kubernetes.core community.general`)

This will import the cluster to Rafay (configured with `rafay_config_file`) when `rafay_import` is set to true.

Example usage:

```
module "something" {
  source = "/path/to/k8s/ec2-kubeadm"
  master_count = 1
  worker_count = 1
  resource_name_prefix = "ben-moduletest"

  aws_credentials_file = "~/.aws/credentials"

  resource_name_prefix = "yourname-kubeadm"

  kubernetes_version = "1.24.4"
  containerd_release_version = "1.6.8"
  runc_release_version = "1.1.4"

  instance_type = "t2.xlarge"
  aws_keypair_private_key = "~/.ssh/id_rsa"
  aws_keypair_public_key = "~/.ssh/id_rsa.pub"

  worker_count = 0
  master_count = 1

  install_kubernetes = true
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.27 |
| <a name="requirement_rafay"></a> [rafay](#requirement\_rafay) | 1.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.75.2 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.2.3 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.0 |
| <a name="provider_rafay"></a> [rafay](#provider\_rafay) | 1.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.kubeadm_master](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.kubeadm_worker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_key_pair.instance_keypair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_lb.kube_api_nlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.kube_api_nlb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.kube_api_nlb_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.kube_api_nlb_tga](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_route_table.rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.rta](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.k8s_worker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [local_file.ansible_inventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.cleanup](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [rafay_import_cluster.terraform-importcluster](https://registry.terraform.io/providers/RafaySystems/rafay/1.1.0/docs/resources/import_cluster) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_credentials_file"></a> [aws\_credentials\_file](#input\_aws\_credentials\_file) | n/a | `string` | `"~/.aws/credentials"` | no |
| <a name="input_aws_keypair_private_key"></a> [aws\_keypair\_private\_key](#input\_aws\_keypair\_private\_key) | n/a | `string` | `"~/.ssh/id_rsa"` | no |
| <a name="input_aws_keypair_public_key"></a> [aws\_keypair\_public\_key](#input\_aws\_keypair\_public\_key) | n/a | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_containerd_release_version"></a> [containerd\_release\_version](#input\_containerd\_release\_version) | n/a | `string` | `"1.6.9"` | no |
| <a name="input_install_kubernetes"></a> [install\_kubernetes](#input\_install\_kubernetes) | n/a | `bool` | `true` | no |
| <a name="input_instance_ami_user"></a> [instance\_ami\_user](#input\_instance\_ami\_user) | n/a | `string` | `"ubuntu"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"t2.xlarge"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | n/a | `string` | `"1.25.3"` | no |
| <a name="input_master_count"></a> [master\_count](#input\_master\_count) | n/a | `number` | `1` | no |
| <a name="input_rafay_blueprint"></a> [rafay\_blueprint](#input\_rafay\_blueprint) | n/a | `string` | `"default"` | no |
| <a name="input_rafay_cluster_name"></a> [rafay\_cluster\_name](#input\_rafay\_cluster\_name) | n/a | `string` | `"ec2-kubeadm-import"` | no |
| <a name="input_rafay_config_file"></a> [rafay\_config\_file](#input\_rafay\_config\_file) | n/a | `string` | `"~/.rafay/cli/config.json"` | no |
| <a name="input_rafay_import"></a> [rafay\_import](#input\_rafay\_import) | n/a | `bool` | `false` | no |
| <a name="input_rafay_project"></a> [rafay\_project](#input\_rafay\_project) | n/a | `string` | `"defaultproject"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-west-2"` | no |
| <a name="input_resource_name_prefix"></a> [resource\_name\_prefix](#input\_resource\_name\_prefix) | Prefix of resource names in AWS | `string` | n/a | yes |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | n/a | `number` | `30` | no |
| <a name="input_runc_release_version"></a> [runc\_release\_version](#input\_runc\_release\_version) | n/a | `string` | `"1.1.4"` | no |
| <a name="input_worker_count"></a> [worker\_count](#input\_worker\_count) | n/a | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubectl"></a> [kubectl](#output\_kubectl) | n/a |
| <a name="output_master_ssh"></a> [master\_ssh](#output\_master\_ssh) | n/a |
| <a name="output_worker_ssh"></a> [worker\_ssh](#output\_worker\_ssh) | n/a |
<!-- END_TF_DOCS -->