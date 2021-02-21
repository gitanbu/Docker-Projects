terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region     = var.AWS_REGION
  
}


terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}

