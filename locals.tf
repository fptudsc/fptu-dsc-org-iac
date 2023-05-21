locals {
  branches_data          = yamldecode(file("${path.module}/config.yaml"))
  full_branch_email_list = toset(flatten([for k in local.branches_data : k.member_username]))
}