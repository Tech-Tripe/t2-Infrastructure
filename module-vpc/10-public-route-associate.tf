resource "aws_route_table_association" "t2_public_route_table_association" {
  count = true ? var.countsub : 0
  subnet_id      = aws_subnet.t2_public_subnet[count.index].id
  route_table_id = data.aws_route_table.t2-pub-route-table.id

  depends_on = [aws_internet_gateway.gw]
  
}