metadata {
  path = "grafana"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:dLCWBGM9SBt+Ep5ldXfYFj5bhkiNYu/XEFae6Fjk+vA="
  retries = 0
}

step "terraform" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "grafana",
  ]

  sha     = "a66de58b9005bfebda37b3d316be18dd9b48298b162c74ac4e3e4945a5676f81"
  retries = 0
}

step "helm" {
  wkdir   = "grafana/helm"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana",
  ]

  sha     = "h1:8f0VAICZchjf4lXU2+O03usCZCTOlMilF6KT0AOiRLQ="
  retries = 0
}
