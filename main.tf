terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "swift" {
  name         = "swift"
  keep_locally = false
}

resource "docker_container" "swift" {
  image = docker_image.swift.image_id
  name  = "tutorial"
}