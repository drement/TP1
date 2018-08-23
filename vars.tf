variable "AWS_REGION" {
  default = "us-east-2"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "../keys/aws_rsa"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "../keys/aws_rsa.pub"
}

variable "RDS_USER" {}
variable "RDS_PASSWORD" {}

variable "AMIS" {
  type = "map"

  default = {
    us-east-1 = "ami-13be557e"
    us-east-2 = "ami-5e8bb23b"
    eu-west-1 = "ami-844e0bf7"
    us-west-2 = "ami-06b94666"
  }
}

variable "AMI_TYPE" {
  description = "Ami type"
  default     = "t2.micro"
}

variable "main_vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.0.0.0/16"
}

variable "main_pub1_cidr" {
  description = "CIDR for Subnet Public 1"
  default     = "10.0.1.0/24"
}

variable "main_pub2_cidr" {
  description = "CIDR for Subnet Public 2"
  default     = "10.0.2.0/24"
}

variable "main_pub3_cidr" {
  description = "CIDR for Subnet Public 3"
  default     = "10.0.3.0/24"
}

variable "main_priv1_cidr" {
  description = "CIDR for Subnet Private 1"
  default     = "10.0.4.0/24"
}

variable "main_priv2_cidr" {
  description = "CIDR for Subnet Private 2"
  default     = "10.0.5.0/24"
}
