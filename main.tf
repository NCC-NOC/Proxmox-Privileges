module "group_noc" {
  source = "./modules/group_noc"
}
module "group_admin" {
  source = "./modules/group_admin"
}
module "terraform" {
  source = "./modules/role_terraform"
}
module "user_kss-24180133" {
  source   = "./modules/users"
  USERNAME = "kss-24180133"
  REALM    = "pam"
  GROUPS   = ["noc", "admin"]
}
module "user_kss-26050070" {
  source   = "./modules/users"
  USERNAME = "kss-26050070"
  GROUPS   = ["noc", "admin"]
}
module "user_kss-25180032" {
  source   = "./modules/users"
  USERNAME = "kss-25180032"
}
module "user_kss-24180219" {
  source   = "./modules/users"
  USERNAME = "kss-24180219"
}
module "user_kss-24180193" {
  source   = "./modules/users"
  USERNAME = "kss-24180193"
}
module "user_kss-24180066" {
  source   = "./modules/users"
  USERNAME = "kss-24180066"
}
