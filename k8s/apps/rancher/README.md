<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.7 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | ~> 2.7 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.16 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.ingress_nginx](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.rancher](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_ingress_v1.rancher_address](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/ingress_v1) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_manager_chart_set"></a> [cert\_manager\_chart\_set](#input\_cert\_manager\_chart\_set) | n/a | `map(string)` | `{}` | no |
| <a name="input_cert_manager_version"></a> [cert\_manager\_version](#input\_cert\_manager\_version) | n/a | `string` | `"v1.7.1"` | no |
| <a name="input_cluster_ca_cert"></a> [cluster\_ca\_cert](#input\_cluster\_ca\_cert) | n/a | `string` | `null` | no |
| <a name="input_cluster_endpoint"></a> [cluster\_endpoint](#input\_cluster\_endpoint) | n/a | `string` | `null` | no |
| <a name="input_eks_cluster"></a> [eks\_cluster](#input\_eks\_cluster) | n/a | `bool` | `false` | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | n/a | `string` | `null` | no |
| <a name="input_eks_cluster_region"></a> [eks\_cluster\_region](#input\_eks\_cluster\_region) | n/a | `string` | `null` | no |
| <a name="input_install_nginx"></a> [install\_nginx](#input\_install\_nginx) | n/a | `bool` | `false` | no |
| <a name="input_kubeconfig_path"></a> [kubeconfig\_path](#input\_kubeconfig\_path) | n/a | `string` | `null` | no |
| <a name="input_nginx_chart_set"></a> [nginx\_chart\_set](#input\_nginx\_chart\_set) | n/a | `map(string)` | `{}` | no |
| <a name="input_nginx_service_type"></a> [nginx\_service\_type](#input\_nginx\_service\_type) | n/a | `string` | `"LoadBalancer"` | no |
| <a name="input_nginx_version"></a> [nginx\_version](#input\_nginx\_version) | n/a | `string` | `"4.0.18"` | no |
| <a name="input_rancher_bootstrap_password"></a> [rancher\_bootstrap\_password](#input\_rancher\_bootstrap\_password) | n/a | `string` | `"someStrongPassword"` | no |
| <a name="input_rancher_chart_set"></a> [rancher\_chart\_set](#input\_rancher\_chart\_set) | n/a | `map(string)` | `{}` | no |
| <a name="input_rancher_hostname"></a> [rancher\_hostname](#input\_rancher\_hostname) | n/a | `string` | `"rancher.example.com"` | no |
| <a name="input_rancher_version"></a> [rancher\_version](#input\_rancher\_version) | n/a | `string` | `"2.6.9"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ingress_address"></a> [ingress\_address](#output\_ingress\_address) | Rancher's ingress IP (Nginx ingress) or hostname (cloud provided LB) |
| <a name="output_rancher_url"></a> [rancher\_url](#output\_rancher\_url) | n/a |
<!-- END_TF_DOCS -->