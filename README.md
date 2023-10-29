# Implementation of Ruby on Rails using Terraform, Docker

## Resources

- Terraform [https://www.terraform.io](https://www.terraform.io)
- Docker [https://www.docker.com/](https://www.docker.com/)

## Create Docker image

From the root directory, run 

`docker build . -t <AWS_ACC_ID>.dkr.ecr.eu-west-1.amazonaws.com/ror_app:<tag>`

Once the image is created and tagged, you'll need to log in using AWS credentials:

`aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin <AWS_ACC_ID>.dkr.ecr.eu-west-1.amazonaws.com`

and upload it to the AWS repository:

`docker push <AWS_ACC_ID>.dkr.ecr.eu-west-1.amazonaws.com/ror_app:<tag>`

## Install Terraform

Install Terraform using this link [https://learn.hashicorp.com/terraform/getting-started/install.html](https://learn.hashicorp.com/terraform/getting-started/install.html)

## Deploying the application on AWS

In the root folder of the Terraform project, create a `.tfvars` file for the staging, production, and/or test environments and specify the value for each variable required in the `vars.tf` file.

For example, in `production.tfvars`:

```
region              = "eu-west-1"
domain              = "ejsrorproject.com"
access_key          = "xxx"
secret_key_base     = "xxx"
environment         = "prod"
availability_zones  = ["eu-west-1a", "eu-west-1b"]
```

After this setup, run the following command in the `terraform/` folder of the project:
`$ terraform init`

After correctly installing the Terraform plugins, run the planning command. When executing the planning command, pass the `--var-file` argument with the value of the `.tfvars` file you want to execute. For instance, to deploy the application in the `production` environment, run the following command:

`$ terraform plan --var-file=production.tfvars`

After creating the plan correctly, run the following command:

`$ terraform apply --var-file=production.tfvars`

This will start creating your AWS infrastructure for the application and will finish by providing the Load Balancer's URL for the application. You can check it using the following command:

`$ terraform output alb_dns_name`

However, the application itself will show the command result when it finishes the deployment.

## Considerations and License

This project was developed as part of the Capstone Project in Bachelor's degree in Computer Engineering from UNIR: Deployment of IaC for Ruby on Rails in Cloud environments.

This software is licensed under the GPLv3 license:

  This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>. 



***


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

## Consideraciones y licencia

Este proyecto ha sido desarrollado como parte del Trabajo de Fin de Grado en Ingeniería Informática de UNIR: Despliegue de IaC para Ruby on Rails en entornos Cloud


Este software está licenciado bajo la licencia GPLv3:

  This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>. 
