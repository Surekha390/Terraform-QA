terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.8.0"
    }
  }
}

resource "aws_instance" "server" {
  ami                    = "ami-0688ba7eeeeefe3cd"
  instance_type          = var.instance_size
  monitoring             = false
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
  root_block_device {
    delete_on_termination = false
    encrypted             = true
    volume_size           = 20
    volume_type           = "standard"
  }
  tags = {
    Name = var.servername
  }
}
