resource "random_password" "password"{
  length = 12
  special = true
}
resource "proxmox_virtual_environment_user" "noc_member" {
  comment  = "NOC Member"
  password = random_password.password.result
  user_id  = "${var.USERNAME}@${var.REALM}"
  groups = var.GROUPS
  enabled = var.ENABLED

  lifecycle{
    ignore_changes = [
      password
    ]
  }
}
data "proxmox_virtual_environment_pool" "member_personal_pool" {
  pool_id = var.USERNAME
}
resource "proxmox_acl" "noc_member_acl_node" {
  user_id   = proxmox_virtual_environment_user.noc_member.user_id
  path      = "/pool/${var.USERNAME}"
  role_id   = "Administrator"
  propagate = true
}

output "Username"{
  value = proxmox_virtual_environment_user.noc_member.user_id
}
output "Password"{
  value = proxmox_virtual_environment_user.noc_member.password
}
