variable "rancher_version" {
  type = string
  default = "2.6.9"
}

variable "cert_manager_version" {
  type = string
  default = "v1.7.1"
}

variable "kubeconfig_path" {
  type = string
  default = "~/.kube/config"
}

variable "rancher_chart_set" {
  type = map(string)
  default = {
    "hostname" = "rancher.example.com"
    "bootstrapPassword" = "someStrongPassword"
  }
}

variable "cert_manager_chart_set" {
  type = map(string)
  default = {
  }
}