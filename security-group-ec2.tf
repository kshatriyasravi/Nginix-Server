resource "aws_security_group" "Nginix-security_group" {
  description = "This is a security group for nginix server"
  vpc_id      = aws_vpc.Ngnix-vpc.id
  name        = "Nginix-security_group"
}
# Allow traffic with port 80 for http 
resource "aws_vpc_security_group_ingress_rule" "Allow_http" {
  security_group_id = aws_security_group.Nginix-security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"

}
# Allow traffic with port 8080 for http 
resource "aws_vpc_security_group_ingress_rule" "Allow_https" {
  security_group_id = aws_security_group.Nginix-security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"

}