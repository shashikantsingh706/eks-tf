data "aws_vpc" "private_vpc" {
  id = var.vpc
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.private_vpc.id]
  }

  filter {
    name   = "subnet-id"
    values = split(",", var.private_subnet_ids)
  }
}


data "aws_subnet" "private_cidr" {
  for_each = toset(data.aws_subnets.private_subnets.ids)
  id       = each.value
}
