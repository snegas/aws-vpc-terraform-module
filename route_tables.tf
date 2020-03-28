resource "aws_route_table" "default_public" {
  count = length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = aws_vpc.default.id

  tags = merge(var.tags, var.public_route_table_tags, {
    "Name" = "${var.prefix}-public-rt"
  })
}

resource "aws_route_table_association" "default_public" {
  depends_on = [aws_route_table.default_public]

  for_each = var.public_subnets

  subnet_id      = aws_subnet.default_public[each.key].id
  route_table_id = aws_route_table.default_public[0].id
}

resource "aws_route" "default_public" {
  count = length(var.public_subnets) > 0 ? 1 : 0

  route_table_id         = aws_route_table.default_public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default[0].id

  timeouts {
    create = "5m"
  }
}

#############################

resource "aws_route_table" "default_private" {
  for_each = var.private_subnets

  vpc_id = aws_vpc.default.id

  tags = merge(var.tags, var.private_route_table_tags, {
    "Name" = "${var.prefix}-private-rt"
  })
}

resource "aws_route_table_association" "default_private" {
  depends_on = [aws_route_table.default_private]

  for_each = var.private_subnets

  subnet_id      = aws_subnet.default_private[each.key].id
  route_table_id = aws_route_table.default_private[each.key].id
}

resource "aws_route" "default_private" {
  for_each = var.private_subnets

  route_table_id         = aws_route_table.default_private[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.default[each.key].id

  timeouts {
    create = "5m"
  }
}

#################################################

resource "aws_route_table" "default_internal" {
  for_each = var.internal_subnets

  vpc_id = aws_vpc.default.id

  tags = merge(var.tags, var.internal_route_table_tags, {
    "Name" = "${var.prefix}-internal-rt"
  })
}

resource "aws_route_table_association" "default_internal" {
  depends_on = [aws_route_table.default_internal]

  for_each = var.internal_subnets

  subnet_id      = aws_subnet.default_internal[each.key].id
  route_table_id = aws_route_table.default_internal[each.key].id
}
