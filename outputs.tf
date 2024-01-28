output "nomad_token_accessor" {
  description = "Nomad ACL token accessor"
  value       = data.vault_nomad_access_token.vault_nomad_token.accessor_id
  sensitive   = false
}
output "nomad_token_secret_id" {
  description = "Nomad ACL token secret id"
  value       = data.vault_nomad_access_token.vault_nomad_token.secret_id
  sensitive   = true
}