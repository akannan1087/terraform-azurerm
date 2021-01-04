data "azurerm_client_config" "current" {}

resource "azurerm_api_management_api" "api" {

  resource_group_name = var.context.resource_group_name

  api_management_name = var.service_settings.endpoint_name

  revision            = var.service_settings.revision
  name                = var.service_settings.name
  display_name        = var.service_settings.description
  path                = var.service_settings.path
  protocols           = [var.service_settings.primary_protocol]
  subscription_required = var.service_settings.subscription_required

}

resource "azurerm_api_management_api_diagnostic" "api" {
  
  identifier               = "applicationinsights"
  resource_group_name      = var.context.resource_group_name
  api_management_name      = var.service_settings.endpoint_name
  api_name                 = azurerm_api_management_api.api.name
  api_management_logger_id = var.observability_settings.api_logger_id

  always_log_errors         = var.insights_settings.always_log_errors
  log_client_ip             = var.insights_settings.log_client_ip
  verbosity                 = var.insights_settings.verbosity
  http_correlation_protocol = var.insights_settings.http_correlation_protocol
}