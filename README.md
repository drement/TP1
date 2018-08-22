# TP1


Crear una tier 2 VPC(public/private subnets) , que publique una página web hacia internet .  Consideraciones a continuación:
 
* ELB debe estar expuesto a internet . 
* Debemos contar con instancias (3)  t2.micro con disco root de 8 GB y un extra volume de 20 GB, montado en la partición /www. La instancia debe exponer la página web en el puerto 8080
* Autoscaling group. 
* La base datos debe ser free tier con un security group que permita conectar a las instancias.  (opcional) - Subnet privada. 
* Creación de un s3 bucket.   (web estático, debe servir archivos complementarios para la página web, ejemplo videos). 
* Sistema operativo a elección 
* EBS snapshot (práctica manual obligatoria ) (automatizada opcional ) 
* Las instancias deben estar distribuidas en diferentes AZ (opcional) 
* Route 53 / cloudfront( opcional). 
* Logs a s3 (opcional)
