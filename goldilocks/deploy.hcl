metadata {
  path = "goldilocks"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "goldilocks/terraform"
  target  = "goldilocks/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:94b6A1wct5LsbHtKM3hYTOhq+SSR/ij02MTqJfWy+KI="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "goldilocks/terraform"
  target  = "goldilocks/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:94b6A1wct5LsbHtKM3hYTOhq+SSR/ij02MTqJfWy+KI="
  retries = 1
}

step "terraform-output" {
  wkdir   = "goldilocks"
  target  = "goldilocks/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "goldilocks",
  ]

  sha     = "h1:94b6A1wct5LsbHtKM3hYTOhq+SSR/ij02MTqJfWy+KI="
  retries = 0
}

step "kube-init" {
  wkdir   = "goldilocks"
  target  = "goldilocks/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "0b4c04668965471ff7ccfdef9ac3b58684d20959ac2eeb0ea2e088afa0c15ac3"
  retries = 0
}

step "crds" {
  wkdir   = "goldilocks"
  target  = "goldilocks/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "goldilocks",
  ]

  sha     = "h1:H4a+KYlIqROhiD54T8DO+u8GcPZMGnmdxVjHY5QqobM="
  retries = 0
}

step "bounce" {
  wkdir   = "goldilocks"
  target  = "goldilocks/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "goldilocks",
  ]

  sha     = "h1:fqBqhZ05JP5kIqw4ZrcjtUs087+J4+2xzkHfCkyOAKk="
  retries = 1
}
