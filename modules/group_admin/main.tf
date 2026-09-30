resource "proxmox_virtual_environment_group" "admin_group" {
  comment  = "Belong to Administrator Group"
  group_id = "admin"
}
resource "proxmox_acl" "noc_member_acl_node" {
  group_id   = proxmox_virtual_environment_group.admin_group.group_id
  path      = "/"
  role_id   = "Administrator"
  propagate = true
}
