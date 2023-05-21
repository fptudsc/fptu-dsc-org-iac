resource "github_team" "teams" {
    for_each = local.branches_data
    name = each.key
    description = each.value.description
    privacy = "closed"
}

resource "github_membership" "user_membership" {
    for_each = local.full_branch_email_list
    username = each.value
    role = "member"
}

resource "github_team_members" "some_team_members" {
  depends_on = [github_membership.user_membership]
  for_each = github_team.teams

  team_id = each.value.id
  dynamic "members" {
    for_each = toset(local.branches_data[each.key].member_emails)
    content {
        username = members.value
        role    = "member"
    }
  }
} 