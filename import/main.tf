provider "azurerm" {
    version = "=2.32.0"
    features {}
}

# create resource group
resource "azurerm_resource_group" "rg"{
    name = "ddp-test"
    location = "eastus2"
}

# create vnet group
resource "azurerm_virtual_network" "vnet"{
    name = "zts-vnet"
    location = "eastus2"
    address_space = ["10.0.0.0/16"]
    resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "default"{
  
    name ="default"
    address_prefixes=["10.0.0.0/24"]
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_subnet" "private"{
    name ="databricks-private"
    address_prefixes=["10.0.1.0/25"]
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_subnet" "public"{
    name ="databricks-public"
    address_prefixes=["10.0.1.128/25"]
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
}

#create nsg
resource "azurerm_network_security_group" "databricks-nsg" {
  name                = "databricksnsgjg6zruolon7g6"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  security_rule = [
              {
                access: "Allow"
                description: "Required for Databricks control plane communication with worker nodes."
                destination_address_prefix: "VirtualNetwork"
                destination_address_prefixes: []
                destination_application_security_group_ids: []
                destination_port_range: "5557"
                destination_port_ranges: []
                direction: "Inbound"
                name: "Microsoft.Databricks-workspaces_UseOnly_databricks-control-plane-to-worker-proxy"
                priority: 102
                protocol: "tcp"
                source_address_prefix: "AzureDatabricks"
                source_address_prefixes: []
                source_application_security_group_ids: []
                source_port_range: "*"
                source_port_ranges: []
              },
              {
                access: "Allow"
                description: "Required for Databricks control plane management of worker nodes."
                destination_address_prefix: "VirtualNetwork"
                destination_address_prefixes: []
                destination_application_security_group_ids: []
                destination_port_range: "22"
                destination_port_ranges: []
                direction: "Inbound"
                name: "Microsoft.Databricks-workspaces_UseOnly_databricks-control-plane-to-worker-ssh"
                priority: 101
                protocol: "tcp"
                source_address_prefix: "AzureDatabricks"
                source_address_prefixes: []
                source_application_security_group_ids: []
                source_port_range: "*"
                source_port_ranges: []
              },
              {
                access: "Allow"
                description: "Required for worker communication with Azure Eventhub services."
                destination_address_prefix: "EventHub"
                destination_address_prefixes: []
                destination_application_security_group_ids: []
                destination_port_range: "9093"
                destination_port_ranges: []
                direction: "Outbound"
                name: "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-eventhub"
                priority: 104
                protocol: "tcp"
                source_address_prefix: "VirtualNetwork"
                source_address_prefixes: []
                source_application_security_group_ids: []
                source_port_range: "*"
                source_port_ranges: []
              },
              {
                access: "Allow"
                description: "Required for worker nodes communication within a cluster."
                destination_address_prefix: "VirtualNetwork"
                destination_address_prefixes: []
                destination_application_security_group_ids: []
                destination_port_range: "*"
                destination_port_ranges: []
                direction: "Inbound"
                name: "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-inbound"
                priority: 100
                protocol: "*"
                source_address_prefix: "VirtualNetwork"
                source_address_prefixes: []
                source_application_security_group_ids: []
                source_port_range: "*"
                source_port_ranges: []
              },
              {
                access: "Allow"
                description: "Required for worker nodes communication within a cluster."
                destination_address_prefix: "VirtualNetwork"
                destination_address_prefixes: []
                destination_application_security_group_ids: []
                destination_port_range: "*"
                destination_port_ranges: []
                direction: "Outbound"
                name: "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-outbound"
                priority: 103
                protocol: "*"
                source_address_prefix: "VirtualNetwork"
                source_address_prefixes: []
                source_application_security_group_ids: []
                source_port_range: "*"
                source_port_ranges: []
              },
              {
                access: "Allow"
                description: "Required for workers communication with Azure SQL services."
                destination_address_prefix: "Sql"
                destination_address_prefixes: []
                destination_application_security_group_ids: []
                destination_port_range: "3306"
                destination_port_ranges: []
                direction: "Outbound"
                name: "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-sql"
                priority: 101
                protocol: "tcp"
                source_address_prefix: "VirtualNetwork"
                source_address_prefixes: []
                source_application_security_group_ids: []
                source_port_range: "*"
                source_port_ranges: []
              },
              {
                access: "Allow"
                description: "Required for workers communication with Azure Storage services."
                destination_address_prefix: "Storage"
                destination_address_prefixes: []
                destination_application_security_group_ids: []
                destination_port_range: "443"
                destination_port_ranges: []
                direction: "Outbound"
                name: "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-storage"
                priority: 102
                protocol: "tcp"
                source_address_prefix: "VirtualNetwork"
                source_address_prefixes: []
                source_application_security_group_ids: []
                source_port_range: "*"
                source_port_ranges: []
              },
              {
                access: "Allow"
                description: "Required for workers communication with Databricks Webapp."
                destination_address_prefix: "AzureDatabricks"
                destination_address_prefixes: []
                destination_application_security_group_ids: []
                destination_port_range: "443"
                destination_port_ranges: []
                direction: "Outbound"
                name: "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-databricks-webapp"
                priority: 100
                protocol: "tcp"
                source_address_prefix: "VirtualNetwork"
                source_address_prefixes: []
                source_application_security_group_ids: []
                source_port_range: "*"
                source_port_ranges: []
              }
  ]
}

resource "azurerm_databricks_workspace" "databricks" {
  name                = "dev-ddp-dtbrcks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "standard"

}