metadata {
  path = "oauth2-proxy"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "oauth2-proxy/terraform"
  target  = "oauth2-proxy/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ah1458BqKjU+LHJBcuFV2CtwVVoBvV/3TpKe1c3AlCA="
}

step "terraform-apply" {
  wkdir   = "oauth2-proxy/terraform"
  target  = "oauth2-proxy/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:ah1458BqKjU+LHJBcuFV2CtwVVoBvV/3TpKe1c3AlCA="
}

step "terraform-output" {
  wkdir   = "oauth2-proxy"
  target  = "oauth2-proxy/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "oauth2-proxy",
  ]

  sha = "h1:ah1458BqKjU+LHJBcuFV2CtwVVoBvV/3TpKe1c3AlCA="
}

step "kube-init" {
  wkdir   = "oauth2-proxy"
  target  = "oauth2-proxy/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "51730b4c5f3f226e20801bbc9d645d466e5cb91f6efafd5ae6f258c842ff8a86"
}

step "crds" {
  wkdir   = "oauth2-proxy"
  target  = "oauth2-proxy/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "oauth2-proxy",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "oauth2-proxy"
  target  = "oauth2-proxy/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "oauth2-proxy",
  ]

  sha = "h1:17bEqi9d6UpjlAxvtATRjDWgftd8lMu1IinetZ/uRaA="
}
