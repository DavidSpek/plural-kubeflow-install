metadata {
  path = "datahub"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "datahub/terraform"
  target  = "datahub/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:j7R8zQnjmIqvuXEpFmzSWMRIa5B5GPx9UFn8E70dkDM="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "datahub/terraform"
  target  = "datahub/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "datahub",
  ]

  sha     = "ebb43a33abb03707d0e09d29c179bf397a25df5ec7ed9a8cb217f1d4abd3f212"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "datahub/helm"
  target  = "datahub/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "datahub",
  ]

  sha     = "h1:XFbPnKwIN3MxhCJwElX7psz37jt0y9iPZGmZiDoPQdk="
  retries = 0
  verbose = false
}
