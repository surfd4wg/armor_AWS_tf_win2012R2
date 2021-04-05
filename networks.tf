resource "aws_vpc" "main" {
    cidr_block = "10.1.0.0/16"
    enable_dns_hostnames = true
    tags ={
        name = "Main VPC"
    }
}

resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id
}

resource "aws_subnet" "main" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.1.15.0/24"
    availability_zone = var.aws_availzone
}

resource "aws_route_table" "default"{
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }
}

resource "aws_route_table_association" "main" {
    subnet_id = aws_subnet.main.id
    route_table_id = aws_route_table.default.id
}

resource "aws_eip" "webserver" {
#    instance = aws_instance.winrm.id 
    count = var.instance_count
    instance = aws_instance.winrm[count.index].id
    vpc = true
    depends_on = [aws_internet_gateway.main]
}
