# Adoption of resources that were created outside of Terraform.
# These existed on the cluster before this state file did, so they are
# imported rather than recreated (recreating would have reset passwords).
#
# Proxmox access-control import IDs:
#   group / role / user -> <id>
#   ACL                 -> <path>?<group|user@realm>?<role>
#
# module.group_noc.proxmox_virtual_environment_role.noc_role is intentionally
# absent: it was the only resource that landed in state on the last apply.
#
# The /nodes, /sdn and /storage ACLs are intentionally absent: they do not
# exist on the cluster and are created by the next apply.

import {
  to = module.group_noc.proxmox_virtual_environment_group.noc_group
  id = "noc"
}

import {
  to = module.group_noc.proxmox_acl.noc_member_acl_pool
  id = "/pool/noc-public?noc?PVEAdmin"
}

import {
  to = module.group_admin.proxmox_virtual_environment_group.admin_group
  id = "admin"
}

import {
  to = module.group_admin.proxmox_acl.noc_member_acl_node
  id = "/?admin?Administrator"
}

import {
  to = module.terraform.proxmox_virtual_environment_role.terraform_role
  id = "Terraform"
}

import {
  to = module.terraform.proxmox_virtual_environment_user.terraform_user
  id = "terraform@pve"
}

import {
  to = module.terraform.proxmox_acl.terraform_acl
  id = "/?terraform@pve?Terraform"
}

import {
  to = module.user_kss-24180066.proxmox_virtual_environment_user.noc_member
  id = "kss-24180066@pve"
}

import {
  to = module.user_kss-24180066.proxmox_acl.noc_member_acl_node
  id = "/pool/kss-24180066?kss-24180066@pve?Administrator"
}

import {
  to = module.user_kss-24180133.proxmox_virtual_environment_user.noc_member
  id = "kss-24180133@pam"
}

import {
  to = module.user_kss-24180133.proxmox_acl.noc_member_acl_node
  id = "/pool/kss-24180133?kss-24180133@pam?Administrator"
}

import {
  to = module.user_kss-24180193.proxmox_virtual_environment_user.noc_member
  id = "kss-24180193@pve"
}

import {
  to = module.user_kss-24180193.proxmox_acl.noc_member_acl_node
  id = "/pool/kss-24180193?kss-24180193@pve?Administrator"
}

import {
  to = module.user_kss-24180219.proxmox_virtual_environment_user.noc_member
  id = "kss-24180219@pve"
}

import {
  to = module.user_kss-24180219.proxmox_acl.noc_member_acl_node
  id = "/pool/kss-24180219?kss-24180219@pve?Administrator"
}

import {
  to = module.user_kss-25180032.proxmox_virtual_environment_user.noc_member
  id = "kss-25180032@pve"
}

import {
  to = module.user_kss-25180032.proxmox_acl.noc_member_acl_node
  id = "/pool/kss-25180032?kss-25180032@pve?Administrator"
}

import {
  to = module.user_kss-26050070.proxmox_virtual_environment_user.noc_member
  id = "kss-26050070@pve"
}

import {
  to = module.user_kss-26050070.proxmox_acl.noc_member_acl_node
  id = "/pool/kss-26050070?kss-26050070@pve?Administrator"
}
