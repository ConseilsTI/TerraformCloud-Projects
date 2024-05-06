output "project_id" {
  description = "The project ID."
  value       = { for k, v in tfe_project.this : k => v.id }
}

output "team" {
  description = "The team resources attributes."
  value       = { for k, v in tfe_team.this : k => v }
}

output "team_id" {
  description = "The ID of the team."
  value       = { for k, v in tfe_team.this : k => v.id }
}

output "team_project_access" {
  description = "The team project access attributes."
  value       = { for k, v in tfe_team_project_access.this : k => v.id }
}