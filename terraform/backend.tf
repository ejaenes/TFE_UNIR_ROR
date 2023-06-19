## Crear y definir el backend s3

terraform {
  backend "s3" {
    bucket  = "ror-terraform-state"
    key     = "ror"
    region  = "eu-west-1"
  }
}
