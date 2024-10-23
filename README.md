# Nginix-Server
This is a repo were we are deploying the nginix server and accessing it from oustide world
# Pre-requesties are:
1. Ec2-instance with an nginix ami image to be deployed.
2. Security group to be created to allow inbound traffic on port 80 and 443.
3. vpc need to be created
4. public and private subnets need to be created
5. internet gateway to be created
6. route-table need to be created
7. access these ngnix with outside world 


The Process should follow in this order (3,4,5,6,1,2)

# To Create a vpc manually, 
1. Go to VPC dashboard
2. Click on create vpc
3. Enter the vpc name and cidr block
4. Click on create vpc

# To Create a public and private subnet manually,
 1. Go to Subnet Dashboard
 2. Click on create subnet
 3. provide the vpcid for which vpc it should be created/linked.
 4. then create a name of the subnet 
 5. then select the availability zone
 6. then select the cidr block for the subnet
 7. then select the ipv6 cidr block for the subnet.

 # Now Create an IGW to this vpc and subnet so that it will be accessible for the external and internal communication.
 1. Go to VPC Dashboard
 2. Click on Internet Gateway
 3. Click on create internet gateway
 4. Click on attach to vpc
 5. Select the vpc for which you want to attach the IGW
 6. Click on attach to vpc

 # Now Create an route table and attach the vpc to it
 1. Go to Route Table Dashboard
 2. Click on create route table
 3. provide the name and attach the vpc to this route table.

 # now create an ec2-instance with ngnix AMI and attach this vpc to it, then create a security policy to the instance like inbound and outbound access.
 1. Go to EC2 Dashboard
 2. provide the name of the instance
 3. select the ami (Nginx) 
 4. select the vpc for which you want to attach the instance
 5. select the subnet for which you want to attach the instance
 6. select the security group for which you want to attach the instance
 7. selcet the storage or create a storage like volume for this instance so that data will be    stored
 8. selcet the size of the instance that should be like t2.micro ,large etc.
 9. Create a key and pair for this ec2-instance for the access purpose.
 10. click on launch instance.



