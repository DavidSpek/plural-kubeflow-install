metadata {
  path = "crossplane"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:5+Rb3JgtjEac6GuyF4JLaWzGZ4MN0ZxnzuBlDfl0K/c="
}

step "terraform-apply" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:5+Rb3JgtjEac6GuyF4JLaWzGZ4MN0ZxnzuBlDfl0K/c="
}

step "terraform-output" {
  wkdir   = "crossplane"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "crossplane",
  ]

  sha = "h1:5+Rb3JgtjEac6GuyF4JLaWzGZ4MN0ZxnzuBlDfl0K/c="
}

step "kube-init" {
  wkdir   = "crossplane"
  target  = "crossplane/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "d76cbf3095641c97034eafc7a23b276fba3cbc22ffb5b44b44cb878e2930c03a"
}

step "crds" {
  wkdir   = "crossplane"
  target  = "crossplane/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "crossplane",
  ]

  sha = "h1:EVuJcAA7WuJRXVU1CIcPLtDQQyXIfFsk2B+ENtAEtn4="
}

step "bounce" {
  wkdir   = "crossplane"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "crossplane",
  ]

  sha = "h1:YeE4sW9aRhDSwAKIG4KGRB4fFyt2HDRPAIU+ppiL5vg="
}
