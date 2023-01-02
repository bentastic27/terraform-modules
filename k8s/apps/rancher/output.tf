output "rancher_url" {
  value = "https://${var.rancher_hostname}/"
}

output "ingress_address" {
  description = "Rancher's ingress IP (Nginx ingress) or hostname (cloud provided LB)"
  value = data.kubernetes_ingress_v1.rancher_address.status != null ? data.kubernetes_ingress_v1.rancher_address.status[0].load_balancer[0].ingress[0] : null
}

