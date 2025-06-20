resource "aws_route_table" "t2_private_route_table" {
  count = true ? var.countsub : 0
  vpc_id = aws_vpc.tech-tribe-vpc.id

  tags = {
    Name = "${var.environment}-t2_private_route_table-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_route" "t2_private_route_table" {
  count = true ? var.countsub : 0
  route_table_id = aws_route_table.t2_private_route_table[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.t2-natgateway[count.index].id
}   