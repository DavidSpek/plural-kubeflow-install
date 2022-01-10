metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:kXvyKokaq2ACg2spD73fw/SO3gHeHE6CJllppE3osFM="
  retries = 0
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:kXvyKokaq2ACg2spD73fw/SO3gHeHE6CJllppE3osFM="
  retries = 0
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "839791d685145b65a3c03ffa343df0abf1df2e175b61bacd0c131a12a66bee52"
  retries = 0
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:5JCEFxDaO5/CLTHRRMmaM7QHMCcYAorrTBEWmcMaepc="
  retries = 0
}
