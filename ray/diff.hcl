metadata {
  path = "ray"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "ray/terraform"
  target  = "ray/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:6QKoqzttJ3OAZA8uWIUY8bIYad9IC8AWsSmIBLgIAMc="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "ray/terraform"
  target  = "ray/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "ray",
  ]

  sha     = "h1:6QKoqzttJ3OAZA8uWIUY8bIYad9IC8AWsSmIBLgIAMc="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "ray"
  target  = "ray/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "ray",
  ]

  sha     = "568a7f4c20cd7ece928c55752b7fa9176d499e7052ffbb03a937ed79e3895667"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "ray/helm"
  target  = "ray/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "ray",
  ]

  sha     = "h1:EICSEKUYo8GswkIiGhBqXlwEe34oLZn8jnM9FZXBlMo="
  retries = 0
  verbose = false
}