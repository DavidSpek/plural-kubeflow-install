metadata {
  path = "mysql"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:eZD4yHxAR8A5M/fUTYyBOQuuhUh8qo6RyYEHR8sz3J0="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:eZD4yHxAR8A5M/fUTYyBOQuuhUh8qo6RyYEHR8sz3J0="
  retries = 1
}

step "terraform-output" {
  wkdir   = "mysql"
  target  = "mysql/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "mysql",
  ]

  sha     = "h1:eZD4yHxAR8A5M/fUTYyBOQuuhUh8qo6RyYEHR8sz3J0="
  retries = 0
}

step "kube-init" {
  wkdir   = "mysql"
  target  = "mysql/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "eb6877f928bc7aaa54f139865bb71776e45071ddf1a4cd364e86ee8f2e185f79"
  retries = 0
}

step "crds" {
  wkdir   = "mysql"
  target  = "mysql/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "mysql",
  ]

  sha     = "h1:044S1+ptG9zyrB8p0LDMQZMd1vTbGQUBUKL3EGBPN5A="
  retries = 0
}

step "bounce" {
  wkdir   = "mysql"
  target  = "mysql/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "mysql",
  ]

  sha     = "h1:BxUinDNjR3uB4Jf9TLACKky4IWke1YH1kMVQ9ddmg4Y="
  retries = 1
}
