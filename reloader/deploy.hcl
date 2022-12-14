metadata {
  path = "reloader"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "reloader/terraform"
  target  = "reloader/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:K0o3jdE4dmOMcflJT5qYXf/1voSK1RMBfp2j/TsO790="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "reloader/terraform"
  target  = "reloader/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:K0o3jdE4dmOMcflJT5qYXf/1voSK1RMBfp2j/TsO790="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "reloader"
  target  = "reloader/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "reloader",
  ]

  sha     = "h1:K0o3jdE4dmOMcflJT5qYXf/1voSK1RMBfp2j/TsO790="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "reloader"
  target  = "reloader/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "7a77efc204dc5ee06f20330d515bf141bdb66489ef2dc4fdd3f49094b69f2d5a"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "reloader"
  target  = "reloader/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "reloader",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "reloader"
  target  = "reloader/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "reloader",
  ]

  sha     = "h1:/RqgAMs4HxTRt80bKEXD1jrbImDModvQitrn7pFnrmI="
  retries = 2
  verbose = false
}
