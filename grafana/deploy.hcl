metadata {
  path = "grafana"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:dLCWBGM9SBt+Ep5ldXfYFj5bhkiNYu/XEFae6Fjk+vA="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:dLCWBGM9SBt+Ep5ldXfYFj5bhkiNYu/XEFae6Fjk+vA="
  retries = 1
}

step "terraform-output" {
  wkdir   = "grafana"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "grafana",
  ]

  sha     = "h1:dLCWBGM9SBt+Ep5ldXfYFj5bhkiNYu/XEFae6Fjk+vA="
  retries = 0
}

step "kube-init" {
  wkdir   = "grafana"
  target  = "grafana/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "a66de58b9005bfebda37b3d316be18dd9b48298b162c74ac4e3e4945a5676f81"
  retries = 0
}

step "crds" {
  wkdir   = "grafana"
  target  = "grafana/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "grafana",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "grafana"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "grafana",
  ]

  sha     = "h1:8f0VAICZchjf4lXU2+O03usCZCTOlMilF6KT0AOiRLQ="
  retries = 1
}
