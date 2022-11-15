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
