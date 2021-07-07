metadata {
  path = "elasticsearch"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "elasticsearch/terraform"
  target  = "elasticsearch/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
}

step "terraform" {
  wkdir   = "elasticsearch/terraform"
  target  = "elasticsearch/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "elasticsearch",
  ]

  sha = ""
}

step "kube-init" {
  wkdir   = "elasticsearch"
  target  = "elasticsearch/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "elasticsearch",
  ]

  sha = ""
}

step "helm" {
  wkdir   = "elasticsearch/helm"
  target  = "elasticsearch/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "elasticsearch",
  ]

  sha = ""
}