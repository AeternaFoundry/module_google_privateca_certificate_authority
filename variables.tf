variable "privateca_certificate_authorities" {
  description = <<EOT
Map of privateca_certificate_authorities, attributes below
Required:
    - certificate_authority_id
    - location
    - pool
    - config (block):
        - subject_config (required, block):
            - subject (required, block):
                - common_name (required)
                - country_code (optional)
                - locality (optional)
                - organization (optional)
                - organizational_unit (optional)
                - postal_code (optional)
                - province (optional)
                - street_address (optional)
            - subject_alt_name (optional, block):
                - dns_names (optional)
                - email_addresses (optional)
                - ip_addresses (optional)
                - uris (optional)
        - subject_key_id (optional, block):
            - key_id (optional)
        - x509_config (required, block):
            - additional_extensions (optional, block):
                - critical (required)
                - object_id (required, block):
                    - object_id_path (required)
                - value (required)
            - aia_ocsp_servers (optional)
            - ca_options (required, block):
                - is_ca (required)
                - max_issuer_path_length (optional)
                - non_ca (optional)
                - zero_max_issuer_path_length (optional)
            - key_usage (required, block):
                - base_key_usage (required, block):
                    - cert_sign (optional)
                    - content_commitment (optional)
                    - crl_sign (optional)
                    - data_encipherment (optional)
                    - decipher_only (optional)
                    - digital_signature (optional)
                    - encipher_only (optional)
                    - key_agreement (optional)
                    - key_encipherment (optional)
                - extended_key_usage (required, block):
                    - client_auth (optional)
                    - code_signing (optional)
                    - email_protection (optional)
                    - ocsp_signing (optional)
                    - server_auth (optional)
                    - time_stamping (optional)
                - unknown_extended_key_usages (optional, block):
                    - object_id_path (required)
            - name_constraints (optional, block):
                - critical (required)
                - excluded_dns_names (optional)
                - excluded_email_addresses (optional)
                - excluded_ip_ranges (optional)
                - excluded_uris (optional)
                - permitted_dns_names (optional)
                - permitted_email_addresses (optional)
                - permitted_ip_ranges (optional)
                - permitted_uris (optional)
            - policy_ids (optional, block):
                - object_id_path (required)
    - key_spec (block):
        - algorithm (optional)
        - cloud_kms_key_version (optional)
Optional:
    - deletion_policy
    - deletion_protection
    - desired_state
    - gcs_bucket
    - ignore_active_certificates_on_deletion
    - labels
    - lifetime
    - pem_ca_certificate
    - project
    - skip_grace_period
    - type
    - subordinate_config (block):
        - certificate_authority (optional)
        - pem_issuer_chain (optional, block):
            - pem_certificates (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - user_defined_access_urls (block):
        - aia_issuing_certificate_urls (optional)
        - crl_access_urls (optional)
EOT

  type = map(object({
    certificate_authority_id               = string
    location                               = string
    pool                                   = string
    deletion_policy                        = optional(string)
    deletion_protection                    = optional(bool)
    desired_state                          = optional(string)
    gcs_bucket                             = optional(string)
    ignore_active_certificates_on_deletion = optional(bool)
    labels                                 = optional(map(string))
    lifetime                               = optional(string)
    pem_ca_certificate                     = optional(string)
    project                                = optional(string)
    skip_grace_period                      = optional(bool)
    type                                   = optional(string)
    config = object({
      subject_config = object({
        subject = object({
          common_name         = string
          country_code        = optional(string)
          locality            = optional(string)
          organization        = optional(string)
          organizational_unit = optional(string)
          postal_code         = optional(string)
          province            = optional(string)
          street_address      = optional(string)
        })
        subject_alt_name = optional(object({
          dns_names       = optional(list(string))
          email_addresses = optional(list(string))
          ip_addresses    = optional(list(string))
          uris            = optional(list(string))
        }))
      })
      subject_key_id = optional(object({
        key_id = optional(string)
      }))
      x509_config = object({
        additional_extensions = optional(list(object({
          critical = bool
          object_id = object({
            object_id_path = list(number)
          })
          value = string
        })))
        aia_ocsp_servers = optional(list(string))
        ca_options = object({
          is_ca                       = bool
          max_issuer_path_length      = optional(number)
          non_ca                      = optional(bool)
          zero_max_issuer_path_length = optional(bool)
        })
        key_usage = object({
          base_key_usage = object({
            cert_sign          = optional(bool)
            content_commitment = optional(bool)
            crl_sign           = optional(bool)
            data_encipherment  = optional(bool)
            decipher_only      = optional(bool)
            digital_signature  = optional(bool)
            encipher_only      = optional(bool)
            key_agreement      = optional(bool)
            key_encipherment   = optional(bool)
          })
          extended_key_usage = object({
            client_auth      = optional(bool)
            code_signing     = optional(bool)
            email_protection = optional(bool)
            ocsp_signing     = optional(bool)
            server_auth      = optional(bool)
            time_stamping    = optional(bool)
          })
          unknown_extended_key_usages = optional(list(object({
            object_id_path = list(number)
          })))
        })
        name_constraints = optional(object({
          critical                  = bool
          excluded_dns_names        = optional(list(string))
          excluded_email_addresses  = optional(list(string))
          excluded_ip_ranges        = optional(list(string))
          excluded_uris             = optional(list(string))
          permitted_dns_names       = optional(list(string))
          permitted_email_addresses = optional(list(string))
          permitted_ip_ranges       = optional(list(string))
          permitted_uris            = optional(list(string))
        }))
        policy_ids = optional(list(object({
          object_id_path = list(number)
        })))
      })
    })
    key_spec = object({
      algorithm             = optional(string)
      cloud_kms_key_version = optional(string)
    })
    subordinate_config = optional(object({
      certificate_authority = optional(string)
      pem_issuer_chain = optional(object({
        pem_certificates = optional(list(string))
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    user_defined_access_urls = optional(object({
      aia_issuing_certificate_urls = optional(list(string))
      crl_access_urls              = optional(list(string))
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

