output "project_id" {
  description = "The project ID."
  value       = { for key, value in tfe_project.this : key => value.id }
}

output "team" {
  description = "The team resources attributes."
  value       = { for key, value in tfe_team.this : key => value }
}

output "team_id" {
  description = "The ID of the team."
  value       = { for key, value in tfe_team.this : key => value.id }
}

output "team_project_access" {
  description = "The team project access attributes."
  value       = { for key, value in tfe_team_project_access.this : key => value.id }
}