metadata {
  path = "trino"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "trino/terraform"
  target  = "trino/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:ia0EfV4FYV+vwdyykIsreqOIOnpMEpm7t/NgnKbuMa8="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "trino/terraform"
  target  = "trino/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:ia0EfV4FYV+vwdyykIsreqOIOnpMEpm7t/NgnKbuMa8="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "trino"
  target  = "trino/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "trino",
  ]

  sha     = "h1:ia0EfV4FYV+vwdyykIsreqOIOnpMEpm7t/NgnKbuMa8="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "trino"
  target  = "trino/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "f8feeca08571b6509bec68677e1b06f3feca475bfc6c2312a04be0ffd0607753"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "trino"
  target  = "trino/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "trino",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "trino"
  target  = "trino/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "trino",
  ]

  sha     = "h1:iRNqBwVHnvu5X/VeV81jlyo8Vjxlu3wJR/S8/n42ELA="
  retries = 1
  verbose = false
}