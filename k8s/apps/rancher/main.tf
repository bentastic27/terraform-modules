terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.7"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.16"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = var.cert_manager_version
  namespace  = "cert-manager"
  create_namespace = true
  max_history = 10

  set {
    name = "installCRDs"
    value = true
  }

  dynamic "set" {
    for_each = var.cert_manager_chart_set
    content {
      name = set.key
      value = set.value
    }
  }
}

resource "helm_release" "rancher" {
  depends_on = [
    helm_release.cert_manager
  ]

  name       = "rancher"
  repository = "https://releases.rancher.com/server-charts/stable"
  chart      = "rancher"
  version    = var.rancher_version
  namespace  = "cattle-system"
  create_namespace = true
  max_history = 10

  dynamic "set" {
    for_each = var.rancher_chart_set
    content {
      name = set.key
      value = set.value
    }
  }
}