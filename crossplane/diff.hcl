metadata {
  path = "crossplane"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:CC3d7aqSG7gmxCpW7Nl5j6Fk4sFEolJScbayMXRiCps="
  retries = 0
}

step "terraform" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "crossplane",
  ]

  sha     = "h1:CC3d7aqSG7gmxCpW7Nl5j6Fk4sFEolJScbayMXRiCps="
  retries = 0
}

step "kube-init" {
  wkdir   = "crossplane"
  target  = "crossplane/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "crossplane",
  ]

  sha     = "aa537dd3cadd3614ba582911b6dd3a0b3b38ef14d47d1b1cef51d998060f3462"
  retries = 0
}

step "helm" {
  wkdir   = "crossplane/helm"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "crossplane",
  ]

  sha     = "h1:j62p1gQFZMJvJPi9a80tzHSzGTMc/XSh561U2Bga+uk="
  retries = 0
}
