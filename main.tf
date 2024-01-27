#generate nomad token

# resource "vault_nomad_secret_backend" "nomad" {
#   backend = "nomad-proj-application1"
#   description = "Nomad secrets engine for Application1 project"
#   default_lease_ttl_seconds = "3600"
#   max_lease_ttl_seconds = "7200"
#   address = "http://10.0.0.194:4646"
#   #token = "ae20ceaa-..."
# }

resource "vault_nomad_secret_role" "tfc-nomad-role-wksp-hello-world" {
  backend = "nomad"
  role = "${var.vault_nomad_secret_role-prefix}hello-world"
  type = "client"
    policies = jsondecode(var.nomad_policies)
}

data "vault_nomad_access_token" "vault_nomad_token" {
 backend = "nomad"
 role    = vault_nomad_secret_role.tfc-nomad-role-wksp-hello-world.role
}

# resource "nomad_acl_token" "token" {
#   name     = "hello-world"
#   type     = "client"
#   policies = ["app-dev"]
# }
#data "nomad_acl_token" "nomad_acl_token" {
#  accessor_id = data.vault_nomad_access_token.vault_nomad_token.accessor_id
  #depends_on = [ data.vault_nomad_access_token.vault_nomad_token ]
#}

resource "nomad_job" "hello-world-job-vault-dynamic-creds" {
  jobspec = file(var.nomad_job_spec_file)
  #depends_on = [ data.vault_nomad_access_token.vault_nomad_token ]
}