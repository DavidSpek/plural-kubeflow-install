metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:UnzP3b5lg3Ew1FvXmwdiwdhSQd5G6XXiQLHCELQPZfs="
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:UnzP3b5lg3Ew1FvXmwdiwdhSQd5G6XXiQLHCELQPZfs="
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha = "h1:UnzP3b5lg3Ew1FvXmwdiwdhSQd5G6XXiQLHCELQPZfs="
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "222424fb929fdffc1d0f2543767070ef67bb72e0ebb3d59d2fe790ae572f8eb2"
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha = "h1:K58dC3a4uKoc98YPgcUCmIk1x9AmL+g+vaBThWgPFCU="
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha = "h1:Wh4JZub2lSnSmwSHbLCU+/eGMREsEqZ46u/jZmXq260="
}
