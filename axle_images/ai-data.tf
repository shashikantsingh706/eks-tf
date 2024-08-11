data "aws_vpc" "private_vpc" {
  id = var.vpc
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.private_vpc.id]
  }
  tags = {
    Type = "Private Subnets"
  }
}

data "aws_subnet" "private_subnets" {
  for_each = toset(data.aws_subnets.private_subnets.ids)
  id       = each.value
}