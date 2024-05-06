<!-- BEGIN_TF_DOCS -->
# Terraform Cloud Private Modules Registry

Code which manages configuration and life-cycle of all the Terraform Cloud
module in the private registry. It is designed to be used from a dedicated
VCS-Driven Terraform Cloud workspace that would provision and manage the
configuration using Terraform code (IaC).

## Permissions

To manage the module in the private registry from that code, provide a token
from an account with `manage modules` access. Alternatively, you can use a
token from a team with that access instead of a user token.

To manage the GitHub resources, provide a token from an account or a GitHub App with
appropriate permissions. It should have:

* Read access to `metadata`
* Read and write access to `administration`, `members` and `code`

To read secrets from Hashicorp Vault Secrets, provide a client ID and a key
from a service principals with the secret `reader` role.

## Authentication

### Terraform Cloud

The Terraform Cloud provider requires a Terraform Cloud/Enterprise API token in
order to manage resources.

* Set the `TFE_TOKEN` environment variable: The provider can read the TFE\_TOKEN environment variable and the token stored there
to authenticate. Refer to [Managing Variables](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables/managing-variables) documentation for more details.

### GitHub

The GitHub provider requires a GitHub App installation in order to manage resources.

* Set the `GITHUB_APP_ID`, `GITHUB_APP_INSTALLATION_ID`, `GITHUB_APP_PEM_FILE`, and `GITHUB_OWNER`
environment variables. The provider can read the GITHUB\_APP\_ID, GITHUB\_APP\_INSTALLATION\_ID,
GITHUB\_APP\_PEM\_FILE, and GITHUB\_OWNER environment variables to authenticate.

> Because strings with new lines is not support:</br>
> use "\\\n" within the `pem_file` argument to replace new line</br>
> use "\n" within the `GITHUB_APP_PEM_FILE` environment variables to replace new line</br>

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

* Manages configuration and life-cycle of GitHub resources:
  * Repository
  * Branch protection
  * Teams
  * Secret
* Manages configuration and life-cycle of Terraform Cloud resources:
  * Private module registry
  * Private module registry test environment variable

## Documentation

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (> 1.6.0)

- <a name="requirement_github"></a> [github](#requirement\_github) (~>5.44)

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

## Optional Inputs

No optional inputs.

## Resources

The following resources are used by this module:

- [tfe_project.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) (resource)
- [tfe_team.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team) (resource)
- [tfe_team_project_access.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_project_access) (resource)
- [tfe_team_token.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_token) (resource)

## Outputs

No outputs.

<!-- markdownlint-disable first-line-h1 -->
------
>This GitHub repository is manage through Terraform Code from [TerraformCloud-Foundation](https://github.com/ConseilsTI/TerraformCloud-Foundation) repository.
<!-- END_TF_DOCS -->