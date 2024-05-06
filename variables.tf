variable "project_names" {
  description = "(Required) A list of project names to create."
  type        = list(string)
}

variable "organization_name" {
  description = "(Required) The name of the Terraform Cloud organization."
  type        = string
}

variable "vault_app_name" {
  description = "(Required) The name of the application where the secret will be stored."
  type        = string
}
