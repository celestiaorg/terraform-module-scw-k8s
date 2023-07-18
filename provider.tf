# ==============================================
# Terraform Providers
# ==============================================
terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.24.0"
    }
  }
}

# ==============================================
# Provider ScaleWay
# ==============================================
provider "scaleway" {
  zone       = var.zone
  region     = var.region
  project_id = var.project_id
}
