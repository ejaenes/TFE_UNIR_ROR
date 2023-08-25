# Implementación de Ruby on Rails utilizando Terraform, Docker

## Recursos

  - Terraform https://www.terraform.io
  - Docker https://www.docker.com/

## Crear imagen de docker

Desde el directorio raíz, ejecutar 

`docker build . -t <AWS_ACC_ID>.dkr.ecr.eu-west-1.amazonaws.com/ror_app:<tag>`

una vez creada y tageada la imagen, tendremos que logearnos con las credenciales de aws

`aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin <AWS_ACC_ID>.dkr.ecr.eu-west-1.amazonaws.com`

y subirla al repositorio de aws:

`docker push <AWS_ACC_ID>.dkr.ecr.eu-west-1.amazonaws.com/ror_app:<tag>`

## Instalar Terraform

Instala terraform utilizando este enlace [https://learn.hashicorp.com/terraform/getting-started/install.html](https://learn.hashicorp.com/terraform/getting-started/install.html)

## Implementando la aplicación en AWS

En la carpeta raíz del proyecto terraform, crea un archivo `.tfvars` para los entornos de staging, producción y/o prueba y especifica el valor de cada variable que se requieren en el archivo `vars.tf`.


Por ejemplo, en `production.tfvars`:

```
region              = "eu-west-1"
domain              = "ejsrorproject.com"
access_key          = "xxx"
secret_key_base     = "xxx"
environment         = "prod"
availability_zones  = ["eu-west-1a", "eu-west-1b"]
```

Después de esta configuración, ejecuta el siguiente comando en la carpeta `terraform/` del proyecto:
`$ terraform init`

Después de instalar correctamente los complementos de Terraform, ejecuta el comando de planificación. Al ejecutar el comando de planificación, pasa el argumento `--var-file` con el valor del archivo `.tfvars` que deseas ejecutar. Por ejemplo, para implementar la aplicación en el entorno de `production`, ejecuta el siguiente comando:

`$ terraform plan --var-file=production.tfvars`

Después de crear el plan correctamente, ejecuta el siguiente comando:

`$ terraform apply --var-file=production.tfvars`

Esto comenzará a crear tu infraestructura de AWS para la aplicación y se completará proporcionando la URL del balanceador de carga de la aplicación utilizando el siguiente comando:

`$ terraform output alb_dns_name`

No obstante, la propia aplicación devolverá el comando corregido.
