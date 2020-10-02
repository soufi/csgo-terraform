variable access_key {}

variable secret_key {}

variable region {}

variable name {
  default = "csgo-server"
}

variable "ami_name" {
  default = "amzn2-ami-hvm-2.0.20200904.0-x86_64-gp2"
}

variable "ami_owner_id" {
  default = "137112412989"
}

variable "instance_type" {
  default = "t2.medium"
}

variable csgo_token_game {}

variable csgo_hostname {
  default = "MULEYS CSGO DEDICATED INSTANCE"
}

variable csgo_ip {
  default = "0"
}

variable csgo_public_ip {
  default = "0"
}

variable csgo_pwd {
  default = "killthemall"
}

variable csgo_rconpw {
  default = "killthemall"
}

variable csgo_port {
  default = 27015
}

variable csgo_tv_port {
  default = 27020
}

variable csgo_map {
  default = "de_dust2"
}

variable csgo_max_players {
  default = 10
}

variable csgo_gametype {
  default = 0
}

variable csgp_gamemode {
  default = 1
}

variable "vpc_cidr" {
  default = "172.31.0.0/20"
}

variable key_pair_name {
  default = "csgo-server-key-pair"
}

variable public_key {}

variable "egress_cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}
