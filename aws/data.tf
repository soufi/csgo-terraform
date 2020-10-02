data "aws_ami" "nodes" {
  owners      = [var.ami_owner_id]
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name]
  }
}

data "template_file" "init_script" {
  template = file("${path.module}/resources/init.sh")

  vars = {
    docker_compose_conf   = file("${path.module}/resources/docker-compose.yml")
    csgo_token_game       = var.csgo_token_game
    csgo_hostname         = var.csgo_hostname
    csgo_ip               = var.csgo_ip
    csgo_public_ip        = var.csgo_public_ip
    csgo_pwd              = var.csgo_pwd
    csgo_rconpw           = var.csgo_rconpw
    csgo_port             = var.csgo_port
    csgo_tv_port          = var.csgo_tv_port
    csgo_map              = var.csgo_map
    csgo_max_players      = var.csgo_max_players
    csgo_gametype         = var.csgo_gametype
    csgp_gamemode         = var.csgp_gamemode
  }
}

data "template_cloudinit_config" "init" {
  part {
    filename     = "init.sh"
    content_type = "text/x-shellscript"
    content      = data.template_file.init_script.rendered
  }
}
