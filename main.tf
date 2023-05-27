resource "github_team" "teams" {
  for_each    = local.branches_data
  name        = each.key
  description = each.value.description
  privacy     = "closed"
}

resource "github_membership" "user_membership" {
  for_each = local.user_list
  username = each.value
  role     = "member"
}

resource "github_membership" "admin_membership" {
  for_each = local.admin_list
  username = each.value
  role     = "admin"
}


resource "github_team_members" "team_members" {
  depends_on = [github_membership.user_membership]
  for_each   = github_team.teams

  team_id = each.value.id
  dynamic "members" {
    for_each = toset(local.branches_data[each.key].member_username)
    content {
      username = members.value
      role     = "member"
    }
  }
} 