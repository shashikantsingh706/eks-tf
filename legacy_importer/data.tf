data "aws_vpc" "private_vpc" { id = var.vpc }

data "aws_subnet_ids" "private_subnets" {
  vpc_id = data.aws_vpc.private_vpc.id
  filter {
    name   = "subnet-id"
    values = split(",", var.private_subnet_ids)
  }
    tags = {
    Type = "Private Subnets"
  }
}

data "aws_subnet" "private_cidr" {
  for_each = data.aws_subnet_ids.private_subnets.ids
  id       = each.value
}
