provider "proxmox" {
  endpoint  = var.PROXMOX_VE_ENDPOINT
  api_token = var.PROXMOX_VE_API_TOKEN

  insecure = var.PROXMOX_VE_INSECURE
}
