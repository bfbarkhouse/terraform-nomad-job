variable "vault_nomad_secret_role-prefix" {
  type        = string
  default     = "tfc-nomad-role-wksp-"
}
variable "nomad_policies" {
  type = string
}
variable "nomad_job_spec_file" {
  type        = string
}
variable "vault_username" {
    type = string
}
variable "vault_password" {
    type = string
}


