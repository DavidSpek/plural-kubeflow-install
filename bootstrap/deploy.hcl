metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:tEyH+06ThHcQ87c8B5MaBcOwE2M96MBa3e9c4iPelQU="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:tEyH+06ThHcQ87c8B5MaBcOwE2M96MBa3e9c4iPelQU="
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha = "h1:tEyH+06ThHcQ87c8B5MaBcOwE2M96MBa3e9c4iPelQU="
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "2d4836f28e6732e9e0e10b48b6e8b198c2168f390d97d58e04a073800be44c05"
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha = "h1:/uFnauwMQ7y5eB+EBYQ/vqbbrac9b266epQzzoUTw3c="
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha = "h1:eeXzhzv5MNxsYawMFktUzLLQh730TnSqXAHQlb3QqsM="
}
