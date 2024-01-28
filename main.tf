resource "vault_nomad_secret_role" "tfc-nomad-role" {
  backend  = "nomad"
  role     = "${var.vault_nomad_secret_role-prefix}${var.tfc-workspace}"
  type     = "client"
  policies = jsondecode(var.nomad_policies)
}

data "vault_nomad_access_token" "vault_nomad_token" {
  backend = "nomad"
  role    = vault_nomad_secret_role.tfc-nomad-role.role
}

resource "nomad_job" "hello-world-job-vault-dynamic-creds" {
  jobspec = file(var.nomad_job_spec_file)
}