variable "region" {
  description = "Region of the ecs cluster"
  default     = "us-east-1"
  type        = string
}

variable "vpc" {
  description = "VPC for this environment"
    default   = "vpc-d0a6cdb4"
    type      =  string
   
}

variable "private_subnet_ids" {
  description = "Subnet list for private resources (e.g. ecs)"
    default   = "subnet-83b962f5,subnet-080e8cd22822f17cb,subnet-62668948"
    type    = string
  }

variable "public_subnet_ids" {
    description = "Subnet list for private resources (e.g. eks)"
    default = "subnet-fe1287c3,subnet-81b962f7,subnet-63668949"
 
  }
