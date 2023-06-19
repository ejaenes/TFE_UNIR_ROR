variable "environment" {
  description = "Entorno"
}
variable "vpc_id" {
  description = "El ID de la VPC"
}
variable "availability_zones" {
  type        = list(string)
  description = "Las zonas de disponibilidad a utilizar"
}
variable "security_groups_ids" {
  type        = list(string)
  description = "Los IDs de los grupos de seguridad a utilizar"
}
variable "subnets_ids" {
  type        = list(string)
  description = "Las subredes privadas a utilizar"
}
variable "public_subnet_ids" {
  type        = list(string)
  description = "Las subredes públicas a utilizar"
}
variable "repository_name" {
  description = "El nombre del repositorio"
}
variable "secret_key_base" {
  description = "La clave secreta base para utilizar en la aplicación"
}
variable "volume" {
  description = "Volumen persistente"
}
variable "region" {
  description = "La región para lanzar el host bastión"
}
variable "ecs_cpu" {
  description = "Define la CPU para el cluster de ecs"
}
variable "ecs_memory" {
  description = "Define la memoria para el cluster de ecs"
}
