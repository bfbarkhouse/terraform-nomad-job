terraform {
  cloud {
    hostname     = "terraform.bfb.com"
    organization = "bfb"

    workspaces {
      name = "nomad-hello-world"
    }
  }
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.24.0"
    }
    nomad = {
      source  = "hashicorp/nomad"
      version = "2.1.0"
    }
  }
}
provider "nomad" {
  address     = "http://10.0.0.194:4646"
  skip_verify = true
  secret_id   = data.vault_nomad_access_token.vault_nomad_token.secret_id
}

provider "vault" {
  address          = "http://10.0.0.194:8200"
  skip_tls_verify  = true
  skip_child_token = true # https://stackoverflow.com/questions/73034161/permission-denied-on-vault-terraform-provider-token-creation
  auth_login_userpass {
    username = var.vault_username
    password = var.vault_password
  }
}