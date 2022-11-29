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
  default = {}
}

variable "rancher_hostname" {
  type = string
  default = "rancher.example.com"
}

variable "rancher_bootstrap_password" {
  type = string
  default = "someStrongPassword"
  sensitive = true
}

variable "cert_manager_chart_set" {
  type = map(string)
  default = {}
}

variable "install_nginx" {
  type = bool
  default = false
}

variable "nginx_version" {
  type = string
  default = "4.0.18"  
}

variable "nginx_service_type" {
  type = string
  default = "LoadBalancer"
}

variable "nginx_chart_set" {
  type = map(string)
  default = {}
}