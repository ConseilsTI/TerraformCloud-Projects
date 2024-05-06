<!-- BEGIN_TF_DOCS -->
# Terraform Cloud Projects Factory

Code which manages configuration and life-cycle of all the Terraform Cloud
projects. It is designed to be used from a dedicated VCS-Driven Terraform Cloud
workspace that would provision and manage the configuration using Terraform code
(IaC).

## Permissions

To manage the resources from that code, provide a token from an account with
`owner` permissions. Alternatively, you can use a token from the `owner` team
instead of a user token.

To manage secrets in Hashicorp Vault Secrets, provide a client ID and a key
from a service principals with the secret `contributor` role.

## Authentication

### Terraform Cloud

The Terraform Cloud provider requires a Terraform Cloud/Enterprise API token in
order to manage resources.

* Set the `TFE_TOKEN` environment variable: The provider can read the TFE\_TOKEN environment variable and the token stored there
to authenticate. Refer to [Managing Variables](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables/managing-variables) documentation for more details.

### Hashicorp Vault Secrets Authentication

The Hashicorp Vault Secrets provider requires a service principal client ID and
a key in order to manage resources.

* Set the `HCP_CLIENT_ID` environment variable: The provider can read the HCP\_CLIENT\_ID
environment variable and the client ID stored there to authenticate. Refer to
[Managing Variables](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables/managing-variables) documentation for more details.

* Set the `HCP_CLIENT_SECRET` environment variable: The provider can read the HCP\_CLIENT\_SECRET
environment variable and the client ID stored there to authenticate. Refer to
[Managing Variables](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables/managing-variables) documentation for more details.

## Features

* Manages configuration and life-cycle of Terraform Cloud resources:
  * projects
  * teams
  * teams project access
  * teams token
* Manages configuration and life-cycle of Hashicorp Vault Secrets
  * secrets

## Documentation

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (> 1.6.0)

- <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) (~>0.76)

- <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) (~>0.51)

## Modules

No modules.

## Required Inputs

The following input variables are required:

### <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name)

Description: (Required) The name of the Terraform Cloud organization.

Type: `string`

### <a name="input_project_names"></a> [project\_names](#input\_project\_names)

Description: (Required) A list of project names to create.

Type: `list(string)`

### <a name="input_vault_app_name"></a> [vault\_app\_name](#input\_vault\_app\_name)

Description: (Required) The name of the application where the secret will be stored.

Type: `string`

## Optional Inputs

No optional inputs.

## Resources

The following resources are used by this module:

- [hcp_vault_secrets_secret.this](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_secrets_secret) (resource)
- [tfe_project.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) (resource)
- [tfe_team.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team) (resource)
- [tfe_team_project_access.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_project_access) (resource)
- [tfe_team_token.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_token) (resource)

## Outputs

The following outputs are exported:

### <a name="output_project_id"></a> [project\_id](#output\_project\_id)

Description: The project ID.

### <a name="output_team"></a> [team](#output\_team)

Description: The team resources attributes.

### <a name="output_team_id"></a> [team\_id](#output\_team\_id)

Description: The ID of the team.

### <a name="output_team_project_access"></a> [team\_project\_access](#output\_team\_project\_access)

Description: The team project access attributes.

<!-- markdownlint-disable first-line-h1 -->
------
>This GitHub repository is manage through Terraform Code from [TerraformCloud-Foundation](https://github.com/ConseilsTI/TerraformCloud-Foundation) repository.
<!-- END_TF_DOCS -->