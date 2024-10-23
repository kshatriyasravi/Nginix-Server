resource "aws_vpc" "Ngnix-vpc" {
  # Need to define the cidr block, so that this vpc can allot the ips
  cidr_block = "10.0.0.0/16"
  # Need to define the name of the vpc
  tags = {
    Name      = "Ngnix-vpc"
    project   = "NginixServer"
    ManagedBy = "Terraform"
  }
  provider = aws.us-east-1
}
output "vpc-output" {
  value = aws_vpc.Ngnix-vpc.id
}
# Creating the subnet inside this vpc 
resource "aws_subnet" "ngnix-publicsubnet" {
  # Need to define the cidr block, so that this subnet can allot the ips
  cidr_block = "10.0.0.0/24"
  vpc_id     = aws_vpc.Ngnix-vpc.id
  tags = {
    name = "Ngnix-publicsubnet"
  }
  provider          = aws.us-east-1
  availability_zone = "us-east-1"
}
output "Ngnix-subnet-output" {
  value = aws_subnet.ngnix-publicsubnet.id
}
resource "aws_subnet" "ngnix-privatesubnet" {
  # Need to define the cidr block, so that this subnet can allot the ips
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.Ngnix-vpc.id
  tags = {
    name = "ngnix-privatesubnet"
  }
  availability_zone = "us-east-1"
}
output "ngnix-privatesubnet-output" {
  value = aws_subnet.ngnix-privatesubnet.id
}
