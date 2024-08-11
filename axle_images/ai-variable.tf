variable "region" {
  description = "Region of the ecs cluster"
  default     = "us-east-1"
  type        = string
}

variable "vpc" {
  description = "VPC for this environment"
  default     = "vpc-084faa779445f13a4"
  type        = string

}

variable "private_subnet_ids" {
  description = "Subnet list for private resources (e.g. ecs)"
  default     = "subnet-077b22e983b606a93,subnet-0b2b48999fce64e4a"
  type        = string
}

variable "public_subnet_ids" {
  description = "Subnet list for private resources (e.g. eks)"
  default     = "subnet-090f2069d6a8e1e9b,subnet-049263cb60ea01382"

}

variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}