terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
  backend "remote"{
    hostname = "app.terraform.io"
    organization = "fptudsc"
    workspaces {
        name = "fptudsc-org-iac"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  owner = "fptudsc"
  app_auth {
    id              = var.app_id
    installation_id = var.installation_id
    pem_file        = var.private_key
  }

}