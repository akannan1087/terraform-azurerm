variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
variable "service_settings" {
  type = object({

    endpoint_name    = string
    name             = string
    description      = string
    revision         = string
    path             = string
    primary_protocol = string
    publish          = bool
    product_id       = list(string)
    backend_name     = string
    subscription_required = string

  })
}
variable "policies" {
  type = object({

    inbound          = string
    outbound         = string
    backend          = string
    error            = string

  })
}

variable "observability_settings" {
  type = object({
    api_logger_id             = string
  })
}


variable "insights_settings" {
  type = object({

    always_log_errors         = bool
    log_client_ip             = bool
    verbosity                 = string
    http_correlation_protocol = string
    })

    default = {
        always_log_errors         = true
        log_client_ip             = true
        verbosity                 = "error"
        http_correlation_protocol = "W3C"
      }
}
