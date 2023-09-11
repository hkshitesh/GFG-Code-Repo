resource "aws_vpc" "gfg-vpc-b10" {
    cidr_block = "10.0.0.0/16"
    tags = {
    Name = "My VPC"
  }  
}

resource "aws_subnet" "gfg-subnet-b10" {
  vpc_id     = aws_vpc.gfg-vpc-b10.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "My Subnet"
  }
}

resource "aws_internet_gateway" "gfg-ig-b10" {
    vpc_id     = aws_vpc.gfg-vpc-b10.id

    tags = {
    Name = "My Internet Gateway"
  }  
}

resource "aws_route_table" "gfg-rt-b10" {
    vpc_id     = aws_vpc.gfg-vpc-b10.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gfg-ig-b10.id
  }

 tags = {
    Name = "My Route Table"
  }
}

resource "aws_route_table_association" "gfg-ta-b10" {
    subnet_id = aws_subnet.gfg-subnet-b10.id
    route_table_id = aws_route_table.gfg-rt-b10.id  
}

resource "aws_security_group" "gfg-sg-b10" {

    name = "gfg-sg-b10"
    vpc_id = aws_vpc.gfg-vpc-b10.id

    ingress {
        from_port = 20
        to_port = 20
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]       
    }
    tags = {
    Name = "My Security Group"
    }  
}

resource "aws_instance" "my_instance" {

    ami = "ami-0f5ee92e2d63afc18"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.gfg-subnet-b10.id
    vpc_security_group_ids = [aws_security_group.gfg-sg-b10.id]  

    tags = {
      Name = "my-vpc-instance"
    }
}


