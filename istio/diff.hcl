metadata {
  path = "istio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:0j8rWcEJe23HDIqiGzTschlEZpIpFMgO6njs7iZZmN8="
}

step "terraform" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "istio",
  ]

  sha = "h1:0j8rWcEJe23HDIqiGzTschlEZpIpFMgO6njs7iZZmN8="
}

step "kube-init" {
  wkdir   = "istio"
  target  = "istio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "istio",
  ]

  sha = "ac21232e943666101e32c03220c793908603e83aa00d765fd28ee4af5b23d4bb"
}

step "helm" {
  wkdir   = "istio/helm"
  target  = "istio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "istio",
  ]

  sha = "h1:9uwLaKZAs/s4j4zajfznMNg2S6+Ex/AdqgTLYwfg9r0="
}
