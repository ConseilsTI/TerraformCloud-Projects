# The following resource block is used to create project resources.

resource "tfe_project" "this" {
  for_each     = toset(var.project_names)
  name         = each.key
  organization = var.organization_name
}

resource "tfe_team" "this" {
  for_each     = toset(var.project_names)
  name         = lower(replace(each.key, "/\\W|_|\\s/", "_"))
  organization = var.organization_name
  visibility   = "organization"
}

resource "tfe_team_token" "this" {
  for_each = tfe_team.this
  team_id  = tfe_team.this[each.key].id
}

resource "tfe_team_project_access" "this" {
  for_each   = tfe_project.this
  access     = "maintain"
  project_id = tfe_project.this[each.key].id
  team_id    = tfe_team.this[each.key].id
}

# The following code blode is used to create secret in Hashicorp Vault.

resource "hcp_vault_secrets_secret" "this" {
  for_each     = tfe_project.this
  app_name     = var.vault_app_name
  secret_name  = tfe_team.this[each.key].name
  secret_value = tfe_team_token.this[each.key].token
}
