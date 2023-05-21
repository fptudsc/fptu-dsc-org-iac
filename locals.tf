locals {
  branches_data = yamldecode(file("${path.module}/config.yaml"))
  user_list     = toset(flatten([for k in local.branches_data : k.member_username if !k.admin]))
  admin_list    = toset(flatten([for k in local.branches_data : k.member_username if k.admin]))
}