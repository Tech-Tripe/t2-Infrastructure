# get the default route table for the VPC
data "aws_route_table" "t2-pub-route-table" {
  vpc_id = aws_vpc.tech-tribe-vpc.id
  filter {
    name   = "association.main"
    values = ["true"]
  }
}
# tag the default route table
resource "aws_ec2_tag" "tag_t2_pub_route_table" {
  resource_id = data.aws_route_table.t2-pub-route-table.id
  key         = "t2"
  value       = "${var.environment}-public-route-table"
}
# associate the default route table with the VPC
resource "aws_main_route_table_association" "main" {
  vpc_id         = aws_vpc.tech-tribe-vpc.id
  route_table_id = data.aws_route_table.t2-pub-route-table.id
}
# add a route to the default route table to allow internet access
resource "aws_route" "t2-pub-route-table" {
    route_table_id = data.aws_route_table.t2-pub-route-table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
}   