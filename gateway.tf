resource "aws_internet_gateway" "default" {
  count = length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = aws_vpc.default.id

  tags = merge(var.tags, var.internet_gateway_tags, {
    "Name" = "${var.prefix}-igw"
  })
}

resource "aws_eip" "default" {
  for_each = var.private_subnets

  vpc = true

  tags = merge(var.tags, var.eip_tags, {
    Name = "${var.prefix}-eip-${each.key}"
  })
}

resource "aws_nat_gateway" "default" {
  depends_on = [aws_internet_gateway.default]

  for_each = var.private_subnets

  subnet_id     = aws_subnet.default_public[each.key].id
  allocation_id = aws_eip.default[each.key].id

  tags = merge(var.tags, var.nat_tags, {
    Name = "${var.prefix}-eip-${each.key}"
  })
}