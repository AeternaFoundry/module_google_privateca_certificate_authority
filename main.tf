resource "google_privateca_certificate_authority" "privateca_certificate_authorities" {
  for_each = var.privateca_certificate_authorities

  certificate_authority_id               = each.value.certificate_authority_id
  location                               = each.value.location
  pool                                   = each.value.pool
  deletion_policy                        = each.value.deletion_policy
  deletion_protection                    = each.value.deletion_protection
  desired_state                          = each.value.desired_state
  gcs_bucket                             = each.value.gcs_bucket
  ignore_active_certificates_on_deletion = each.value.ignore_active_certificates_on_deletion
  labels                                 = each.value.labels
  lifetime                               = each.value.lifetime
  pem_ca_certificate                     = each.value.pem_ca_certificate
  project                                = each.value.project
  skip_grace_period                      = each.value.skip_grace_period
  type                                   = each.value.type

  config {
    subject_config {
      subject {
        common_name         = each.value.config.subject_config.subject.common_name
        country_code        = each.value.config.subject_config.subject.country_code
        locality            = each.value.config.subject_config.subject.locality
        organization        = each.value.config.subject_config.subject.organization
        organizational_unit = each.value.config.subject_config.subject.organizational_unit
        postal_code         = each.value.config.subject_config.subject.postal_code
        province            = each.value.config.subject_config.subject.province
        street_address      = each.value.config.subject_config.subject.street_address
      }
      dynamic "subject_alt_name" {
        for_each = each.value.config.subject_config.subject_alt_name != null ? [each.value.config.subject_config.subject_alt_name] : []
        content {
          dns_names       = subject_alt_name.value.dns_names
          email_addresses = subject_alt_name.value.email_addresses
          ip_addresses    = subject_alt_name.value.ip_addresses
          uris            = subject_alt_name.value.uris
        }
      }
    }
    dynamic "subject_key_id" {
      for_each = each.value.config.subject_key_id != null ? [each.value.config.subject_key_id] : []
      content {
        key_id = subject_key_id.value.key_id
      }
    }
    x509_config {
      dynamic "additional_extensions" {
        for_each = each.value.config.x509_config.additional_extensions != null ? each.value.config.x509_config.additional_extensions : []
        content {
          critical = additional_extensions.value.critical
          object_id {
            object_id_path = additional_extensions.value.object_id.object_id_path
          }
          value = additional_extensions.value.value
        }
      }
      aia_ocsp_servers = each.value.config.x509_config.aia_ocsp_servers
      ca_options {
        is_ca                       = each.value.config.x509_config.ca_options.is_ca
        max_issuer_path_length      = each.value.config.x509_config.ca_options.max_issuer_path_length
        non_ca                      = each.value.config.x509_config.ca_options.non_ca
        zero_max_issuer_path_length = each.value.config.x509_config.ca_options.zero_max_issuer_path_length
      }
      key_usage {
        base_key_usage {
          cert_sign          = each.value.config.x509_config.key_usage.base_key_usage.cert_sign
          content_commitment = each.value.config.x509_config.key_usage.base_key_usage.content_commitment
          crl_sign           = each.value.config.x509_config.key_usage.base_key_usage.crl_sign
          data_encipherment  = each.value.config.x509_config.key_usage.base_key_usage.data_encipherment
          decipher_only      = each.value.config.x509_config.key_usage.base_key_usage.decipher_only
          digital_signature  = each.value.config.x509_config.key_usage.base_key_usage.digital_signature
          encipher_only      = each.value.config.x509_config.key_usage.base_key_usage.encipher_only
          key_agreement      = each.value.config.x509_config.key_usage.base_key_usage.key_agreement
          key_encipherment   = each.value.config.x509_config.key_usage.base_key_usage.key_encipherment
        }
        extended_key_usage {
          client_auth      = each.value.config.x509_config.key_usage.extended_key_usage.client_auth
          code_signing     = each.value.config.x509_config.key_usage.extended_key_usage.code_signing
          email_protection = each.value.config.x509_config.key_usage.extended_key_usage.email_protection
          ocsp_signing     = each.value.config.x509_config.key_usage.extended_key_usage.ocsp_signing
          server_auth      = each.value.config.x509_config.key_usage.extended_key_usage.server_auth
          time_stamping    = each.value.config.x509_config.key_usage.extended_key_usage.time_stamping
        }
        dynamic "unknown_extended_key_usages" {
          for_each = each.value.config.x509_config.key_usage.unknown_extended_key_usages != null ? each.value.config.x509_config.key_usage.unknown_extended_key_usages : []
          content {
            object_id_path = unknown_extended_key_usages.value.object_id_path
          }
        }
      }
      dynamic "name_constraints" {
        for_each = each.value.config.x509_config.name_constraints != null ? [each.value.config.x509_config.name_constraints] : []
        content {
          critical                  = name_constraints.value.critical
          excluded_dns_names        = name_constraints.value.excluded_dns_names
          excluded_email_addresses  = name_constraints.value.excluded_email_addresses
          excluded_ip_ranges        = name_constraints.value.excluded_ip_ranges
          excluded_uris             = name_constraints.value.excluded_uris
          permitted_dns_names       = name_constraints.value.permitted_dns_names
          permitted_email_addresses = name_constraints.value.permitted_email_addresses
          permitted_ip_ranges       = name_constraints.value.permitted_ip_ranges
          permitted_uris            = name_constraints.value.permitted_uris
        }
      }
      dynamic "policy_ids" {
        for_each = each.value.config.x509_config.policy_ids != null ? each.value.config.x509_config.policy_ids : []
        content {
          object_id_path = policy_ids.value.object_id_path
        }
      }
    }
  }

  key_spec {
    algorithm             = each.value.key_spec.algorithm
    cloud_kms_key_version = each.value.key_spec.cloud_kms_key_version
  }

  dynamic "subordinate_config" {
    for_each = each.value.subordinate_config != null ? [each.value.subordinate_config] : []
    content {
      certificate_authority = subordinate_config.value.certificate_authority
      dynamic "pem_issuer_chain" {
        for_each = subordinate_config.value.pem_issuer_chain != null ? [subordinate_config.value.pem_issuer_chain] : []
        content {
          pem_certificates = pem_issuer_chain.value.pem_certificates
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "user_defined_access_urls" {
    for_each = each.value.user_defined_access_urls != null ? [each.value.user_defined_access_urls] : []
    content {
      aia_issuing_certificate_urls = user_defined_access_urls.value.aia_issuing_certificate_urls
      crl_access_urls              = user_defined_access_urls.value.crl_access_urls
    }
  }
}

