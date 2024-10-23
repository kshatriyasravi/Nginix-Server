# Creating an internetGW and connect it to the vpc
resource "aws_internet_gateway" "IGW" {
  # here it is connected to the vpc 
  vpc_id = aws_vpc.Ngnix-vpc.id
  tags = {
    name = "IGW"
  }

}
output "IGW-output" {
  value = aws_internet_gateway.IGW.id
}
# Here we are creating a route table for the vpc to connect to the iGW
resource "aws_route_table" "Route_table" {
  vpc_id = aws_vpc.Ngnix-vpc.id
  tags = {
    name = "Route_table"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

}
resource "aws_route_table_association" "aws_route_table_association_public" {
  subnet_id      = aws_subnet.ngnix-publicsubnet.id
  route_table_id = aws_route_table.Route_table.id
}
output "aws_route_table_association_output" {
  value = aws_route_table_association.aws_route_table_association_public.id

}
resource "aws_route_table_association" "aws_route_table_association_private" {
  subnet_id      = aws_subnet.ngnix-privatesubnet.id
  route_table_id = aws_route_table.Route_table.id
}
output "aws_route_table_association_output_private" {
  value = aws_route_table_association.aws_route_table_association_private.id
}