variable "vpc_cidr" {
  description = "El bloque CIDR de la VPC"
}
variable "public_subnets_cidr" {
  type        = list(string)
  description = "El bloque CIDR para la subred pública"
}
variable "private_subnets_cidr" {
  type        = list(string)
  description = "El bloque CIDR para la subred privada"
}
variable "environment" {
  description = "El entorno"
}
variable "region" {
  description = "La región para lanzar el host bastión"
}
variable "availability_zones" {
  type        = list(string)
  description = "Las zonas de disponibilidad donde se lanzarán los recursos"
}
variable "key_name" {
  description = "La clave pública para el host bastión"
}
