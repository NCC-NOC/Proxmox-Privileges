variable "USERNAME"{
  type = string
  validation {
    condition = (
      var.USERNAME != null
      && var.USERNAME != ""
      && !can(regex("^[0-9]", var.USERNAME))
    )
    error_message = "USERNAME is Invalid"
  }
}
variable "REALM"{
  type = string
  default = "pve"
}
variable "GROUPS"{
  type = list(string)
  default = ["noc"]
}
variable "ENABLED"{
  type = bool
  default = true
}
