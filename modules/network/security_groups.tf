#Security Groups
resource "aws_security_group" "main" {
    name        = "${var.project}-main"
    description = "Default security group to allow inbound/outbound from the VPC"
    vpc_id      = aws_vpc.main.id
    depends_on  = [ aws_vpc.main ]

    ingress {
        from_port = "0"
        to_port   = "0"
        protocol  = "-1"
        self      = true
    }

    egress {
        from_port = "0"
        to_port   = "0"
        protocol  = "-1"
        self      = true
    }

    tags = {
        Name        = "sg-${var.project}-main"
    }
}

resource "aws_security_group" "internet" {
    vpc_id      = aws_vpc.main.id
    name        = "${var.project}-internet"
    description = "security group that allows all egress traffic"
    depends_on  = [ aws_vpc.main ]
    
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name        = "sg-${var.project}-internet"
    }
}

resource "aws_security_group" "ssh" {
    vpc_id      = aws_vpc.main.id
    name        = "${var.project}-ssh"
    description = "Security group that allow ssh access"
    depends_on  = [ aws_vpc.main ]
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "sg-${var.project}-ssh"
    }
}

resource "aws_security_group" "http" {
    vpc_id      = aws_vpc.main.id
    name        = "${var.project}-http"
    description = "Security group that allow ssh access"
    depends_on  = [ aws_vpc.main ]
    
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "sg-${var.project}-http"
    }
}