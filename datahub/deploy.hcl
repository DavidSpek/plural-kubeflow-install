metadata {
  path = "datahub"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "datahub/terraform"
  target  = "datahub/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:j7R8zQnjmIqvuXEpFmzSWMRIa5B5GPx9UFn8E70dkDM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "datahub/terraform"
  target  = "datahub/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:j7R8zQnjmIqvuXEpFmzSWMRIa5B5GPx9UFn8E70dkDM="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "datahub"
  target  = "datahub/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "datahub",
  ]

  sha     = "h1:j7R8zQnjmIqvuXEpFmzSWMRIa5B5GPx9UFn8E70dkDM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "datahub"
  target  = "datahub/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "7aa0a64c85d2516b8af300c98a4891c7d77f87348e4c927b5fbcc39d05ef709b"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "datahub"
  target  = "datahub/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "datahub",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "datahub"
  target  = "datahub/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "datahub",
  ]

  sha     = "h1:RIO1J8QsDwEv227Awg/TevU0CTfjsJAJu4AYA87F9AQ="
  retries = 2
  verbose = false
}
