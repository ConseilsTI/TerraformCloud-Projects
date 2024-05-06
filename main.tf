# The following resource block is used to create project resources.

resource "tfe_project" "this" {
  for_each     = toset(var.project_names)
  name         = each.key
  organization = var.organization_name
}

resource "tfe_team" "this" {
  for_each     = tfe_project.this
  name         = lower(replace(each.value.name, "/\\W|_|\\s/", "-"))
  organization = var.organization_name
  visibility   = "organization"
}

resource "tfe_team_token" "this" {
  for_each = tfe_project.this
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
  app_name     = hcp_vault_secrets_app.this.app_name
  secret_name  = tfe_team.this[each.key].name
  secret_value = tfe_team_token.this[each.key].token
}















# # The following code block is used to create GitHub team.

# resource "github_team" "this" {
#   for_each    = { for team in var.teams : team.name => team if team.create }
#   name        = each.value.name
#   description = each.value.description
#   privacy     = "closed"
# }

# # The following code block is use to get information about GitHub team.

# data "github_team" "this" {
#   for_each = { for team in var.teams : team.name => team if !team.create }
#   slug     = each.value.name
# }






# data "hcp_vault_secrets_secret" "tfc_api_token" {
#   count       = var.tfc_api_token.secret_app != null && var.tfc_api_token.secret_name != null ? 1 : 0
#   app_name    = var.tfc_api_token.secret_app
#   secret_name = var.tfc_api_token.secret_name
# }





# # The following block is use to get information about an OAuth client.

# data "tfe_oauth_client" "client" {
#   organization = var.organization_name
#   name         = var.oauth_client_name
# }



# locals {
#   github_modules = flatten([for module in var.module_names :
#     flatten([for variable in var.github_enviromnent_variables :
#       merge(
#         variable,
#         {
#           module_name = module
#         }
#       )
#     ]) if lower(element(split("-", module), 1)) == "github"
#   ])
# }

# data "hcp_vault_secrets_secret" "github_module_variables" {
#   for_each    = { for module in local.github_modules : module.secret_name => module }
#   app_name    = each.value.secret_app
#   secret_name = each.value.secret_name
# }


