locals {
  ecr_address = "public.ecr.aws/n1i7o3y8"
}

provider "docker" {
    host = "unix:///var/run/docker.sock"

    registry_auth {
        address = local.ecr_address
        username = "AWS"
        config_file = pathexpand("~/.docker/config.json")
    }
}

data "docker_registry_image" "flask" {
    name = "${local.ecr_address}/bitwalaecr:flask"
}

data "docker_registry_image" "nginx" {
    name = "${local.ecr_address}/bitwalaecr:nginx"
}


resource "docker_image" "flask" {
    name = data.docker_registry_image.flask.name
    pull_triggers = [data.docker_registry_image.flask.sha256_digest]
    keep_locally = true
}


output "flask" {
  value = data.docker_registry_image.flask.name
}

resource "docker_image" "nginx" {
    name = data.docker_registry_image.nginx.name
    pull_triggers = [data.docker_registry_image.nginx.sha256_digest]
    keep_locally  = true
}


output "nginx" {
  value = data.docker_registry_image.nginx.name
}

resource "docker_container" "flaskapp" {
  name  = "flaskapp"
  image =  docker_image.flask.name
  restart = "always"
  ports {
    external = 5000
    internal = 5000 
  }
 
}

resource "docker_container" "nginxapp" {
  name = "nginxapp"
  image = docker_image.nginx.name
  depends_on = [docker_container.flaskapp]
  restart = "always"
  ports {
    internal = 80
    external = 80
  }
  ports {
    internal = 443
    external = 443
 }
/*  networks_advanced {
    name    = "${docker_network.public_bridge_network.name}"

  networks_advanced {
    name    = "${docker_network.private_bridge_network.name}"

  }
}*/
}


/*resource "docker_network" "public_bridge_network" {
  name   = "public__network"
  driver = "bridge"
}

resource "docker_network" "private_bridge_network" {
  name     = "private_internal"
  driver   = "bridge"
  internal = true
}*/
