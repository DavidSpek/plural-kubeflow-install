metadata {
  path = "goldilocks"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "goldilocks/terraform"
  target  = "goldilocks/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:T1lS6Tn3thjxpyeF2M8MqjWEP7VrXQtSj8uylAmiIyw="
}

step "terraform-apply" {
  wkdir   = "goldilocks/terraform"
  target  = "goldilocks/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:T1lS6Tn3thjxpyeF2M8MqjWEP7VrXQtSj8uylAmiIyw="
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

  sha = "h1:T1lS6Tn3thjxpyeF2M8MqjWEP7VrXQtSj8uylAmiIyw="
}

step "kube-init" {
  wkdir   = "goldilocks"
  target  = "goldilocks/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "0c2855ff0619bbd480f5032b8ffc7010a31b502a73f50a5f7006ce8544f5a27e"
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

  sha = "h1:H4a+KYlIqROhiD54T8DO+u8GcPZMGnmdxVjHY5QqobM="
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

  sha = "h1:aMfhqKvk1YrHFMsN0ID5skNQeOpn6klWyo5N2sZ+4WM="
}
