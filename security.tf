resource "aws_network_acl" "allowall" {
  vpc_id = aws_vpc.main.id

  #Allow All Out
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  #Allow All In
  ingress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_security_group" "allowall" {
#  name        = "VPCcraig Allow All"
  description = "Allows All traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 1880
    to_port = 1880
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 18800
    to_port = 18800
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  
  ingress {
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 4119
    to_port = 4119
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 4120
    to_port = 4120
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 4122
    to_port = 4122
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 5140
    to_port = 5140
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 5141
    to_port = 5141
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 5443
    to_port  = 5443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 5400
    to_port = 5600
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 5516
    to_port = 5516
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 5985
    to_port = 5985
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 5986
    to_port = 5986
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
}
