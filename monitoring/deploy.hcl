metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:eZGbPjdigQUyuYrZEqBLFti2v94WT6Ra+BenaC25v2k="
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:eZGbPjdigQUyuYrZEqBLFti2v94WT6Ra+BenaC25v2k="
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha = "h1:eZGbPjdigQUyuYrZEqBLFti2v94WT6Ra+BenaC25v2k="
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "2e7c3e7dd72b7033f79753afe7fee9d4cb65b5ff1eee9d8a8c90115005ee7e55"
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha = "h1:K58dC3a4uKoc98YPgcUCmIk1x9AmL+g+vaBThWgPFCU="
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha = "h1:1A2ueqq0LhcrK9/LeqseIqNrlnhVltegeSM/dOafMBM="
}
