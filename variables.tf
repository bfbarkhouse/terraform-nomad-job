variable "vault_nomad_secret_role-prefix" {
  type    = string
  default = "tfc-nomad-role-wksp-"
}
variable "tfc-workspace" {
  type        = string
  description = "Name of the Terraform workspace. This must match the workspace name you will enter on the next screen."
}
variable "nomad_policies" {
  type        = string
  description = "A comma separated list of Nomad ACL policies to give the ACL token used to access Nomad. Example: [ \"app-dev\", \"namespace1\" ]"
}
variable "nomad_job_spec_file" {
  type        = string
  description = "Full path of the Nomad jobspec file to submit."
}
variable "vault_username" {
  type        = string
  description = "Your Vault username."
}
variable "vault_password" {
  type        = string
  description = "Your Vault password."
  sensitive = true
}


