metadata {
  path = "ingress-nginx"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:lHsBatr6hj2T8n9mwlQV9WWXU34fuOvwKu7t8NE8dsA="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:lHsBatr6hj2T8n9mwlQV9WWXU34fuOvwKu7t8NE8dsA="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "ingress-nginx",
  ]

  sha     = "h1:lHsBatr6hj2T8n9mwlQV9WWXU34fuOvwKu7t8NE8dsA="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "b6ce57d5deb0aeddfcc01c59c192cbe0d38b41719c7d26aec51bef18122903ce"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "ingress-nginx",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "ingress-nginx",
  ]

  sha     = "h1:d+K0n429CbUHeh1tEIgjXm13pHW5pLNR+J0ryU+dZ/E="
  retries = 1
  verbose = false
}
