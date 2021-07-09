metadata {
  path = "mysql"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Rd3cHcMWVgPW0WfQC3rSWt0DsXLbUNjLABP6UqldnHM="
}

step "terraform" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "mysql",
  ]

  sha = "h1:Rd3cHcMWVgPW0WfQC3rSWt0DsXLbUNjLABP6UqldnHM="
}

step "kube-init" {
  wkdir   = "mysql"
  target  = "mysql/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "mysql",
  ]

  sha = "9f2f27be6033c776629b7c8d696fb9ac6632969ff7336b12716cbfd02fbeb7c5"
}

step "helm" {
  wkdir   = "mysql/helm"
  target  = "mysql/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "mysql",
  ]

  sha = "h1:dTvPTF5y1PpeQUtH0FYjuolvD9jCevCL1jHvjN+FwRA="
}
