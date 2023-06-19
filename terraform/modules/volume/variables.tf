variable "name" {
  description = "El nombre del volumen"
  type        = string
}
variable "availability_zone" {
  description = "La zona de disponibilidad en la cual crear el volumen"
  type        = string
}
variable "size" {
  description = "El tamaño del volumen en GB"
  type        = number
}
