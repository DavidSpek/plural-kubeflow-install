resource "kubernetes_namespace" "renovate" {
  metadata {
    name = var.namespace
    labels = {
      "app.kubernetes.io/managed-by" = "plural"
      "app.plural.sh/name" = "renovate"

    }
  }
}

