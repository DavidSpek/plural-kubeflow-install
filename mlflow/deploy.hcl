metadata {
  path = "mlflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:j0e6x/IcqNv0dGMlPMVckrdw6vXBYgNhdPNLZvR0oU4="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:j0e6x/IcqNv0dGMlPMVckrdw6vXBYgNhdPNLZvR0oU4="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "mlflow"
  target  = "mlflow/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "mlflow",
  ]

  sha     = "h1:j0e6x/IcqNv0dGMlPMVckrdw6vXBYgNhdPNLZvR0oU4="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "mlflow"
  target  = "mlflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "5417f0f694ee69df6d774db050b2bc18d4516c8db5e5b818885fdaff3fb4f4ce"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "mlflow"
  target  = "mlflow/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "mlflow",
  ]

  sha     = "h1:VWu9qY0X5doaRHIqAV38mjG0hKInlNwo5YwT9XiUSvQ="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "mlflow"
  target  = "mlflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "mlflow",
  ]

  sha     = "h1:gKV9fhxs2v0rrLCoGTcAQAJSHVwSu+lPOCpqBM9c3Dc="
  retries = 1
  verbose = false
}
