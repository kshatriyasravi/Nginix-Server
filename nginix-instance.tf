resource "aws_instance" "Nginix-instance" {
  # Nginix ami from market place
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.ngnix-publicsubnet.id
  # This is not manditory. 
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
  tags = {
    name = "Nginix-instance-with-terraform"
  }
  # Associate the security group with ec2-instance
  vpc_security_group_ids = [aws_security_group.Nginix-security_group]
}