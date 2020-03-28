resource "aws_subnet" "default_public" {
  for_each = var.public_subnets

  vpc_id                  = aws_vpc.default.id
  cidr_block              = each.value
  map_public_ip_on_launch = var.assign_public_ips_on_launch
  availability_zone       = "${data.aws_region.current.name}${each.key}"


  tags = merge(var.tags, var.subnet_tags, var.private_subnet_tags, {
    Name = "${var.prefix}-public-${each.key}"
  })
}

resource "aws_subnet" "default_private" {
  for_each = var.private_subnets

  vpc_id                  = aws_vpc.default.id
  cidr_block              = each.value
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_region.current.name}${each.key}"

  tags = merge(var.tags, var.subnet_tags, var.private_subnet_tags, {
    Name = "${var.prefix}-private-${each.key}"
  })
}

resource "aws_subnet" "default_internal" {
  for_each = var.internal_subnets

  vpc_id                  = aws_vpc.default.id
  cidr_block              = each.value
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_region.current.name}${each.key}"

  tags = merge(var.tags, var.subnet_tags, var.internal_subnet_tags, {
    Name = "${var.prefix}-internal-${each.key}"
  })
}