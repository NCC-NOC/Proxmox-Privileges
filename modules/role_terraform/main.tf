resource "random_password" "password"{
  length = 12
  special = true
}
resource "proxmox_virtual_environment_role" "terraform_role" {
  role_id = "Terraform"

  privileges = [
    "Datastore.Allocate",
    "Datastore.AllocateSpace",
    "Datastore.AllocateTemplate",
    "Datastore.Audit",
    "Group.Allocate",
    "Mapping.Audit",
    "Mapping.Modify",
    "Mapping.Use",
    "Permissions.Modify",
    "Pool.Allocate",
    "Pool.Audit",
    "Realm.Allocate",
    "Realm.AllocateUser",
    "SDN.Allocate",
    "SDN.Audit",
    "SDN.Use",
    "Sys.AccessNetwork",
    "Sys.Audit",
    "Sys.Console",
    "Sys.Incoming",
    "Sys.Modify",
    "Sys.PowerMgmt",
    "Sys.Syslog",
    "User.Modify",
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
    "VM.GuestAgent.FileRead",
    "VM.GuestAgent.FileSystemMgmt",
    "VM.GuestAgent.FileWrite",
    "VM.GuestAgent.Unrestricted",
    "VM.Migrate",
    "VM.PowerMgmt",
    "VM.Replicate",
    "VM.Snapshot",
    "VM.Snapshot.Rollback"
  ]
}
resource "proxmox_virtual_environment_user" "terraform_user" {
  comment  = "To Manage by Terraform"
  password = random_password.password.result
  user_id  = "terraform@pve"
  enabled = true
  
  lifecycle{
    ignore_changes = [
      password
    ]
  }
} 
resource "proxmox_acl" "terraform_acl" {
  user_id   = proxmox_virtual_environment_user.terraform_user.user_id
  path      = "/"
  role_id   = proxmox_virtual_environment_role.terraform_role.role_id
  propagate = true
}

output "Terraform_Username"{
  value = proxmox_virtual_environment_user.terraform_user.user_id
}
output "Terraform_Password"{
  value = proxmox_virtual_environment_user.terraform_user.password
}
