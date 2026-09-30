resource "proxmox_virtual_environment_role" "noc_role" {
  role_id = "noc"

  privileges = [
    "Datastore.AllocateSpace",
    "Datastore.AllocateTemplate",
    "Datastore.Audit",
    "Pool.Audit",
    "SDN.Audit",
    "SDN.Use",
    "Sys.AccessNetwork",
    "Sys.Audit",
    "VM.Allocate",
    "VM.Audit",
    "VM.Backup",
    "VM.Clone",
    "VM.Config.CDROM",
    "VM.Config.CPU",
    "VM.Config.Cloudinit",
    "VM.Config.Disk",
    "VM.Config.HWType",
    "VM.Config.Memory",
    "VM.Config.Network",
    "VM.Config.Options",
    "VM.Console",
    "VM.GuestAgent.Audit",
    "VM.PowerMgmt",
    "VM.Replicate",
    "VM.Snapshot",
    "VM.Snapshot.Rollback"
  ]
}
resource "proxmox_virtual_environment_group" "noc_group" {
  comment  = "Belong to NOC Group"
  group_id = "noc"
}
resource "proxmox_acl" "noc_member_acl_node" {
  group_id   = proxmox_virtual_environment_group.noc_group.group_id
  path      = "/nodes"
  role_id   = proxmox_virtual_environment_role.noc_role.role_id
  propagate = true
}
resource "proxmox_acl" "noc_member_acl_pool" {
  group_id   = proxmox_virtual_environment_group.noc_group.group_id
  path      = "/pool/noc-public"
  role_id   = proxmox_virtual_environment_role.noc_role.role_id
  propagate = true
}
resource "proxmox_acl" "noc_member_acl_sdn" {
  group_id   = proxmox_virtual_environment_group.noc_group.group_id
  path      = "/sdn"
  role_id   = proxmox_virtual_environment_role.noc_role.role_id
  propagate = true
}
resource "proxmox_acl" "noc_member_acl_storage" {
  group_id   = proxmox_virtual_environment_group.noc_group.group_id
  path      = "/storage"
  role_id   = proxmox_virtual_environment_role.noc_role.role_id
  propagate = true
}
