variable "region" {
  description = "Región donde se crearán las instancias"
}
variable "domain" {
  default     = "El dominio de tu aplicación"
}
variable "secret_key_base" {
  description = "La clave secreta de Rails"
}
variable "access_key" {
  description = "La clave de acceso para AWS"
}
variable "environment" {
  description = "Entorno para la aplicación"
}
variable "availability_zones" {
  type        = list(string)
}
