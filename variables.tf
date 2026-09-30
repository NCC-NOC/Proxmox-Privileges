variable "PROXMOX_VE_ENDPOINT" {
  type = string
}
variable "PROXMOX_VE_API_TOKEN" {
  type      = string
  sensitive = true
}
variable "PROXMOX_VE_INSECURE" {
  type    = bool
  default = true
}
