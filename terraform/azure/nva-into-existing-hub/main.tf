//********************** Basic Configuration **************************//
resource "azurerm_resource_group" "managed-app-rg" {
  name     = var.resource-group-name
  location = var.location
}

data "azurerm_virtual_hub" "vwan-hub" {
  name                = var.vwan-hub-name
  resource_group_name = var.vwan-hub-resource-group
}

//********************** Image Version **************************//

data "external" "az_access_token" {
  count = var.authentication_method == "Azure CLI" ? 1 : 0
  program = ["az", "account", "get-access-token", "--resource=https://management.azure.com", "--output=json"]
}

data "http" "azure_auth" {
  count = var.authentication_method == "Service Principal" ? 1 : 0
  url    = "https://login.microsoftonline.com/${var.tenant_id}/oauth2/v2.0/token"
  method = "POST"
  request_headers = {
    "Content-Type" = "application/x-www-form-urlencoded"
  }
  request_body = "grant_type=client_credentials&client_id=${var.client_id}&client_secret=${var.client_secret}&scope=https://management.azure.com/.default"
}

locals {
  access_token = var.authentication_method == "Service Principal" ? jsondecode(data.http.azure_auth[0].response_body).access_token : data.external.az_access_token[0].result.accessToken
}

data "http" "image-versions" {
  method = "GET"
  url = "https://management.azure.com/subscriptions/${var.subscription_id}/providers/Microsoft.Network/networkVirtualApplianceSKUs/checkpoint${strcontains(var.cloudguard-version, "NGTX") ? "-ngtx" : ""}?api-version=2020-05-01"
  request_headers = {
    Accept = "application/json"
    "Authorization" = "Bearer ${local.access_token}"
  }
}

locals {
      image_versions = tolist([for version in jsondecode(data.http.image-versions.response_body).properties.availableVersions : version if substr(version, 0, 4) == lower(substr(replace(var.cloudguard-version, ".", ""), 1, 4))])
}

//********************** Managed Application Configuration **************************//
resource "azurerm_managed_application" "nva" {
  name                        = var.managed-app-name
  location                    = azurerm_resource_group.managed-app-rg.location
  resource_group_name         = azurerm_resource_group.managed-app-rg.name
  kind                        = "MarketPlace"
  managed_resource_group_name = var.nva-rg-name

  plan {
    name      = "vwan-app"
    product   = "azure-vwan"
    publisher = "checkpoint"
    version   = "1.0.7"
  }
  parameter_values = jsonencode({
    location = {
      value = azurerm_resource_group.managed-app-rg.location
    },
    hubId = {
      value = data.azurerm_virtual_hub.vwan-hub.id
    },
    cloudGuardVersion = {
      value = var.cloudguard-version
    },
    imageVersion = {
      value = element(local.image_versions, length(local.image_versions) -1)
    },
    scaleUnit = {
      value = var.scale-unit
    },
    bootstrapScript = {
      value = var.bootstrap-script
    },
    adminShell = {
      value = var.admin-shell
    },
    sicKey = {
      value = var.sic-key
    },
    sshPublicKey = {
      value = var.ssh-public-key
    },
    BGP = {
      value = var.bgp-asn
    },
    NVA = {
      value = var.nva-name
    },
    customMetrics = {
      value = var.custom-metrics
    },
    hubASN = {
      value = data.azurerm_virtual_hub.vwan-hub.virtual_router_asn
    },
    hubPeers = {
      value = data.azurerm_virtual_hub.vwan-hub.virtual_router_ips
    },
    smart1CloudTokenA = {
      value = var.smart1-cloud-token-a
    },
    smart1CloudTokenB = {
      value = var.smart1-cloud-token-b
    },
    smart1CloudTokenC = {
      value = var.smart1-cloud-token-c
    },
    smart1CloudTokenD = {
      value = var.smart1-cloud-token-d
    },
    smart1CloudTokenE = {
      value = var.smart1-cloud-token-e
    }
  })
}