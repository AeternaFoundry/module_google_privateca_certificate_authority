output "privateca_certificate_authorities_id" {
  description = "Map of id values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no id are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.id if v.id != null && length(v.id) > 0 }
}
output "privateca_certificate_authorities_access_urls" {
  description = "Map of access_urls values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no access_urls are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.access_urls if v.access_urls != null && length(v.access_urls) > 0 }
}
output "privateca_certificate_authorities_certificate_authority_id" {
  description = "Map of certificate_authority_id values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no certificate_authority_id are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.certificate_authority_id if v.certificate_authority_id != null && length(v.certificate_authority_id) > 0 }
}
output "privateca_certificate_authorities_config" {
  description = "Map of config values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no config are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => one(v.config) if v.config != null && length(v.config) > 0 }
}
output "privateca_certificate_authorities_create_time" {
  description = "Map of create_time values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no create_time are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "privateca_certificate_authorities_deletion_policy" {
  description = "Map of deletion_policy values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no deletion_policy are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "privateca_certificate_authorities_deletion_protection" {
  description = "Map of deletion_protection values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no deletion_protection are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.deletion_protection if v.deletion_protection != null }
}
output "privateca_certificate_authorities_desired_state" {
  description = "Map of desired_state values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no desired_state are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.desired_state if v.desired_state != null && length(v.desired_state) > 0 }
}
output "privateca_certificate_authorities_effective_labels" {
  description = "Map of effective_labels values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no effective_labels are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "privateca_certificate_authorities_gcs_bucket" {
  description = "Map of gcs_bucket values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no gcs_bucket are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.gcs_bucket if v.gcs_bucket != null && length(v.gcs_bucket) > 0 }
}
output "privateca_certificate_authorities_ignore_active_certificates_on_deletion" {
  description = "Map of ignore_active_certificates_on_deletion values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no ignore_active_certificates_on_deletion are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.ignore_active_certificates_on_deletion if v.ignore_active_certificates_on_deletion != null }
}
output "privateca_certificate_authorities_key_spec" {
  description = "Map of key_spec values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no key_spec are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => one(v.key_spec) if v.key_spec != null && length(v.key_spec) > 0 }
}
output "privateca_certificate_authorities_labels" {
  description = "Map of labels values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no labels are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "privateca_certificate_authorities_lifetime" {
  description = "Map of lifetime values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no lifetime are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.lifetime if v.lifetime != null && length(v.lifetime) > 0 }
}
output "privateca_certificate_authorities_location" {
  description = "Map of location values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no location are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.location if v.location != null && length(v.location) > 0 }
}
output "privateca_certificate_authorities_name" {
  description = "Map of name values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no name are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.name if v.name != null && length(v.name) > 0 }
}
output "privateca_certificate_authorities_pem_ca_certificate" {
  description = "Map of pem_ca_certificate values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no pem_ca_certificate are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.pem_ca_certificate if v.pem_ca_certificate != null && length(v.pem_ca_certificate) > 0 }
}
output "privateca_certificate_authorities_pem_ca_certificates" {
  description = "Map of pem_ca_certificates values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no pem_ca_certificates are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.pem_ca_certificates if v.pem_ca_certificates != null && length(v.pem_ca_certificates) > 0 }
}
output "privateca_certificate_authorities_pool" {
  description = "Map of pool values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no pool are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.pool if v.pool != null && length(v.pool) > 0 }
}
output "privateca_certificate_authorities_project" {
  description = "Map of project values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no project are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.project if v.project != null && length(v.project) > 0 }
}
output "privateca_certificate_authorities_skip_grace_period" {
  description = "Map of skip_grace_period values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no skip_grace_period are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.skip_grace_period if v.skip_grace_period != null }
}
output "privateca_certificate_authorities_state" {
  description = "Map of state values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no state are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.state if v.state != null && length(v.state) > 0 }
}
output "privateca_certificate_authorities_subordinate_config" {
  description = "Map of subordinate_config values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no subordinate_config are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => one(v.subordinate_config) if v.subordinate_config != null && length(v.subordinate_config) > 0 }
}
output "privateca_certificate_authorities_terraform_labels" {
  description = "Map of terraform_labels values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no terraform_labels are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}
output "privateca_certificate_authorities_type" {
  description = "Map of type values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no type are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.type if v.type != null && length(v.type) > 0 }
}
output "privateca_certificate_authorities_update_time" {
  description = "Map of update_time values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no update_time are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}
output "privateca_certificate_authorities_user_defined_access_urls" {
  description = "Map of user_defined_access_urls values across all privateca_certificate_authorities, keyed the same as var.privateca_certificate_authorities except keys with no user_defined_access_urls are omitted"
  value       = { for k, v in google_privateca_certificate_authority.privateca_certificate_authorities : k => one(v.user_defined_access_urls) if v.user_defined_access_urls != null && length(v.user_defined_access_urls) > 0 }
}

