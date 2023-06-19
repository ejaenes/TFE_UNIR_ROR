# Configuración del proveedor para AWS
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key_base
}

# Bloque de configuración de Terraform
terraform {
  # Bloque de proveedores requeridos
  required_providers {
    aws = { // Proveedor de AWS
      version = "~> 2.13.0"
    }
    random = { // Proveedor que permite la generación de valores aleatorios
      version = ">= 2.1.2"
    }
  }
  # Versión requerida de Terraform
  required_version = ">= 0.12"
}
