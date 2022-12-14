metadata {
  path = "external-secrets"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "external-secrets/terraform"
  target  = "external-secrets/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:tc8PV+YS3TT6X9DVYnov6HnM8E/VQgNJ0rQV5wfv/B0="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "external-secrets/terraform"
  target  = "external-secrets/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:tc8PV+YS3TT6X9DVYnov6HnM8E/VQgNJ0rQV5wfv/B0="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "external-secrets"
  target  = "external-secrets/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "external-secrets",
  ]

  sha     = "h1:tc8PV+YS3TT6X9DVYnov6HnM8E/VQgNJ0rQV5wfv/B0="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "external-secrets"
  target  = "external-secrets/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "3e87dfae028465c45dd1d9a20558a5851e46afa8bf88ffb44eec2ec746736e64"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "external-secrets"
  target  = "external-secrets/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "external-secrets",
  ]

  sha     = "h1:WXiV3GoyoT/Lsu9ctnyVgg/TxJOOK7dDxL2nz3kGwg4="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "external-secrets"
  target  = "external-secrets/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "external-secrets",
  ]

  sha     = "h1:eLKLVExfO3QiMLYSfPa+GfMutH6DvCfI8OsAKFKVPk8="
  retries = 2
  verbose = false
}
