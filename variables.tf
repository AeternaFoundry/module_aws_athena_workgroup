variable "athena_workgroups" {
  description = <<EOT
Map of athena_workgroups, attributes below
Required:
    - name
Optional:
    - description
    - force_destroy
    - region
    - state
    - tags
    - tags_all
    - configuration (block):
        - bytes_scanned_cutoff_per_query (optional)
        - customer_content_encryption_configuration (optional, block):
            - kms_key (optional)
        - enable_minimum_encryption_configuration (optional)
        - enforce_workgroup_configuration (optional)
        - engine_version (optional, block):
            - selected_engine_version (optional)
        - execution_role (optional)
        - identity_center_configuration (optional, block):
            - enable_identity_center (optional)
            - identity_center_instance_arn (optional)
        - managed_query_results_configuration (optional, block):
            - enabled (optional)
            - encryption_configuration (optional, block):
                - kms_key (optional)
        - monitoring_configuration (optional, block):
            - cloud_watch_logging_configuration (optional, block):
                - enabled (required)
                - log_group (optional)
                - log_stream_name_prefix (optional)
                - log_type (optional, block):
                    - key (required)
                    - values (required)
            - managed_logging_configuration (optional, block):
                - enabled (required)
                - kms_key (optional)
            - s3_logging_configuration (optional, block):
                - enabled (required)
                - kms_key (optional)
                - log_location (optional)
        - publish_cloudwatch_metrics_enabled (optional)
        - query_results_s3_access_grants_configuration (optional, block):
            - authentication_type (required)
            - create_user_level_prefix (optional)
            - enable_s3_access_grants (required)
        - requester_pays_enabled (optional)
        - result_configuration (optional, block):
            - acl_configuration (optional, block):
                - s3_acl_option (required)
            - encryption_configuration (optional, block):
                - encryption_option (optional)
                - kms_key_arn (optional)
            - expected_bucket_owner (optional)
            - output_location (optional)
EOT

  type = map(object({
    name          = string
    description   = optional(string)
    force_destroy = optional(bool)
    region        = optional(string)
    state         = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    configuration = optional(object({
      bytes_scanned_cutoff_per_query = optional(number)
      customer_content_encryption_configuration = optional(object({
        kms_key = optional(string)
      }))
      enable_minimum_encryption_configuration = optional(bool)
      enforce_workgroup_configuration         = optional(bool)
      engine_version = optional(object({
        selected_engine_version = optional(string)
      }))
      execution_role = optional(string)
      identity_center_configuration = optional(object({
        enable_identity_center       = optional(bool)
        identity_center_instance_arn = optional(string)
      }))
      managed_query_results_configuration = optional(object({
        enabled = optional(bool)
        encryption_configuration = optional(object({
          kms_key = optional(string)
        }))
      }))
      monitoring_configuration = optional(object({
        cloud_watch_logging_configuration = optional(object({
          enabled                = bool
          log_group              = optional(string)
          log_stream_name_prefix = optional(string)
          log_type = optional(list(object({
            key    = string
            values = set(string)
          })))
        }))
        managed_logging_configuration = optional(object({
          enabled = bool
          kms_key = optional(string)
        }))
        s3_logging_configuration = optional(object({
          enabled      = bool
          kms_key      = optional(string)
          log_location = optional(string)
        }))
      }))
      publish_cloudwatch_metrics_enabled = optional(bool)
      query_results_s3_access_grants_configuration = optional(object({
        authentication_type      = string
        create_user_level_prefix = optional(bool)
        enable_s3_access_grants  = bool
      }))
      requester_pays_enabled = optional(bool)
      result_configuration = optional(object({
        acl_configuration = optional(object({
          s3_acl_option = string
        }))
        encryption_configuration = optional(object({
          encryption_option = optional(string)
          kms_key_arn       = optional(string)
        }))
        expected_bucket_owner = optional(string)
        output_location       = optional(string)
      }))
    }))
  }))
  # Note: 17 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

