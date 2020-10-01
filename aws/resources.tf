resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.name}-vpc"
  }
}

locals {
  root_volume_type = "gp2"
  root_volume_size = "50"
  volume_delete_on_termination = true
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_pair_name
  public_key = var.public_key
}

resource "aws_instance" "server" {
  ami                         = var.ami_name
  instance_type               = var.instance_type_worker
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  
  key_name = var.key_pair

  tags = {
    Name = var.name
  }

  volume_tags = {
    Name = "${var.name}-volume"
  }

  user_data = data.template_cloudinit_config.init.rendered

  # OS
  root_block_device {
    volume_type           = local.root_volume_type
    volume_size           = local.root_volume_size
    delete_on_termination = local.volume_delete_on_termination
  }
}
