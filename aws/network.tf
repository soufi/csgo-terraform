resource "aws_security_group" "sg" {
  name   = var.name
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.name}-sg"
  }
}

resource "aws_security_group_rule" "egress_traffic" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = var.egress_cidr_blocks
  security_group_id = aws_security_group.sg.id
  description       = "Outbound"
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
  description       = "SSH access"
}

resource "aws_security_group_rule" "portainer" {
  type              = "ingress"
  from_port         = 9000
  to_port           = 9000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
  description       = "Portainer access"
}

resource "aws_security_group_rule" "csgo_27015" {
  type              = "ingress"
  from_port         = 27015
  to_port           = 27015
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
  description       = "CSGO access"
}

resource "aws_security_group_rule" "csgo_27020" {
  type              = "ingress"
  from_port         = 27020
  to_port           = 27020
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
  description       = "CSGO access"
}

resource "aws_security_group_rule" "csgo_51840" {
  type              = "ingress"
  from_port         = 51840
  to_port           = 51840
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
  description       = "CSGO access"
}
