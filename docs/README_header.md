# Terraform Cloud Projects Factory

Code which manages configuration and life-cycle of all the Terraform Cloud
projects. It is designed to be used from a dedicated VCS-Driven Terraform Cloud
workspace that would provision and manage the configuration using Terraform code
(IaC).

## Permissions

To manage the Terraform Cloud projects from that code, provide a token
from an account with `manage all projects` access. Alternatively, you can use a
token from a team with that access instead of a user token.

To manage secrets in Hashicorp Vault Secrets, provide a client ID and a key
from a service principals with the secret `contributor` role.

## Authentication

### Terraform Cloud

The Terraform Cloud provider requires a Terraform Cloud/Enterprise API token in
order to manage resources.

* Set the `TFE_TOKEN` environment variable: The provider can read the TFE_TOKEN environment variable and the token stored there
to authenticate. Refer to [Managing Variables](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables/managing-variables) documentation for more details.

### Hashicorp Vault Secrets Authentication

The Hashicorp Vault Secrets provider requires a service principal client ID and
a key in order to manage resources.

* Set the `HCP_CLIENT_ID` environment variable: The provider can read the HCP_CLIENT_ID
environment variable and the client ID stored there to authenticate. Refer to
[Managing Variables](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables/managing-variables) documentation for more details.

* Set the `HCP_CLIENT_SECRET` environment variable: The provider can read the HCP_CLIENT_SECRET
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
