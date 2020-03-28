output "this_vpc" {
  value = {
    id  = aws_vpc.default.id
    arn = aws_vpc.default.arn
  }
}

output "this_subnets" {
  value = {
    public = {
      ids  = values(aws_subnet.default_public)[*].id
      arns = values(aws_subnet.default_public).*.arn
    }
    private = {
      ids  = values(aws_subnet.default_private).*.id
      arns = values(aws_subnet.default_private).*.arn
    }
    internal = {
      ids  = values(aws_subnet.default_internal).*.id
      arns = values(aws_subnet.default_internal).*.arn
    }
  }
}

output "this_nat_gateways" {
  value = {
    eips       = values(aws_eip.default).*.id
    public_ids = values(aws_eip.default).*.public_ip
    ids        = values(aws_nat_gateway.default).*.id
  }
}

output "this_internet_gateway" {
  value = aws_internet_gateway.default[0].id
}