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
  debug = true
  kubernetes {
    config_path = var.kubeconfig_path
    host = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_ca_cert)
    dynamic "exec" {
      for_each = var.eks_cluster ? toset([1]) : toset([])
      content {
        api_version = "client.authentication.k8s.io/v1beta1"
        args        = ["eks", "get-token", "--cluster-name", var.eks_cluster_name, "--region", var.eks_cluster_region]
        command     = "aws"
      }
    }
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

resource "helm_release" "ingress_nginx" {
  count = var.install_nginx ? 1 : 0
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.nginx_version
  namespace  = "ingress-nginx"
  create_namespace = true
  max_history = 10

  set {
    name = "controller.service.type"
    value = var.nginx_service_type
  }

  dynamic "set" {
    for_each = var.nginx_chart_set
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
    # hacky conditional dynamic block
    for_each = var.install_nginx ? toset([1]) : toset([])
    content {
      name = "ingress.ingressClassName"
      value = "nginx"
    }
  }

  set {
    name = "hostname"
    value = var.rancher_hostname
  }

  set {
    name = "bootstrapPassword"
    value = var.rancher_bootstrap_password
  }

  dynamic "set" {
    for_each = var.rancher_chart_set
    content {
      name = set.key
      value = set.value
    }
  }
}