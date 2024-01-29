variable "nomad_secrets_role" {
  type = string
  description = "Name of the Nomad secrets engine role used to submit the job. Note: If your Vault identity doesn't not have permissions to the role, the run will fail."
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


