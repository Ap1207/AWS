provider "aws" {}

resource "aws_security_group" "default" {
	name = "sgtest"

    ingress {
    	from_port   = 22
    	to_port     = 22
    	protocol    = "tcp"
    	cidr_blocks = ["0.0.0.0/0"]
    }

	ingress {
    	from_port   = 0
    	to_port     = 65535
    	protocol    = "tcp"
    	cidr_blocks = ["0.0.0.0/0"]
  	}

	egress {
    	from_port   = 0
    	to_port     = 65535
    	protocol    = "tcp"
    	cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_key_pair" "dn-test1" {
   key_name = "dn-test1"
   public_key = "${file("/home/dim/certs/test.pub")}"
}

resource "aws_instance" "manager" {
	ami           			= "ami-916f59f4"
	instance_type 			= "t2.micro"
	key_name 				= "test1"
	vpc_security_group_ids 	= ["${aws_security_group.default.id}"]
	
	tags {
    	Name = "manager"
   }
}

resource "aws_instance" "worcker1" {
    ami                     = "ami-916f59f4"
    instance_type           = "t2.micro"
    key_name                = "test1"
    vpc_security_group_ids  = ["${aws_security_group.default.id}"]
    
    tags {
        Name = "worcker1"
   }
}

resource "aws_instance" "worcker2" {
    ami                     = "ami-916f59f4"
    instance_type           = "t2.micro"
    key_name                = "test1"
    vpc_security_group_ids  = ["${aws_security_group.default.id}"]
    
    tags {
        Name = "worcker2"
   }
}
