output "project_id" {
  description = "The project ID."
  value       = {for value in tfe_project.this: value.key => value.id}
}

output "team" {
  description = "The team resources attributes."
  value       = {for value in tfe_team.this: value.key => value}
}

output "team_id" {
  description = "The ID of the team."
  value       = {for value in tfe_team.this: value.key => value.id}
}

output "team_project_access" {
  description = "The team project access attributes."
  value       = {for value in tfe_team_project_access.this: value.key => value.id}
}