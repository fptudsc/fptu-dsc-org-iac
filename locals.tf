locals {
  branches_data = yamldecode(file("${path.module}/config.yaml"))
  admin_list    = toset(flatten([for k in local.branches_data : k.member_username if k.admin]))
  user_list      = toset([for user in flatten([for k in local.branches_data : k.member_username if !k.admin]) : user if !contains(local.admin_list, user)])
}