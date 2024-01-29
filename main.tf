data "vault_nomad_access_token" "vault_nomad_token" {
  backend = "nomad"
  role = var.nomad_secrets_role
}

resource "nomad_job" "job" {
  jobspec = file(var.nomad_job_spec_file) #this function works only with files that are distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain this result from an attribute of that resource.
  deregister_on_destroy = true
}