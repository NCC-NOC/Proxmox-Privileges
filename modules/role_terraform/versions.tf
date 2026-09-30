terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.114"
    }
    random = {
      source = "hashicorp/random",
      version = "~> 3.9"
    }
  }
}

