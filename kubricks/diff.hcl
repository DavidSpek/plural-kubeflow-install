metadata {
  path = "kubricks"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubricks/terraform"
  target  = "kubricks/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:8EKpl9qDLBn5JsW+vvaVIiThHU306e/8sFL0qTFGEYA="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "kubricks/terraform"
  target  = "kubricks/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kubricks",
  ]

  sha     = "h1:8EKpl9qDLBn5JsW+vvaVIiThHU306e/8sFL0qTFGEYA="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kubricks"
  target  = "kubricks/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kubricks",
  ]

  sha     = "fba4c4358ce6212381655fefc78035058c7d1b12ed33c56a19ec3fbfcc3e7cfc"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "kubricks/helm"
  target  = "kubricks/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kubricks",
  ]

  sha     = "h1:388n0x4m2cWPAMcFEntCsydCDDfcxRHg2exs6Hvmg4s="
  retries = 0
  verbose = false
}
