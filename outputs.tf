output "nomad_token_accessor" {
  description = "Nomad ACL token accessor"
  value       = data.vault_nomad_access_token.vault_nomad_token.accessor_id
  sensitive   = false
}