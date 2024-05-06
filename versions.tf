# Configure the minimum required providers supported
terraform {

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~>0.51"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "~>0.76"
    }
  }

  required_version = "> 1.6.0"

}