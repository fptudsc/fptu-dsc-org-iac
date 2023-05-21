terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
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