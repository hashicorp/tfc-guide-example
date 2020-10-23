resource "azurerm_network_security_group" "dbr-nsg" {
  name                = "acceptanceTestSecurityGroup1"
  location            = var.rg_location
  resource_group_name = var.rg_name

  security_rule = [
    {
      access : "Allow"
      description : "Required for Databricks control plane communication with worker nodes."
      destination_address_prefix : "VirtualNetwork"
      destination_address_prefixes : []
      destination_application_security_group_ids : []
      destination_port_range : "5557"
      destination_port_ranges : []
      direction : "Inbound"
      name : "Microsoft.Databricks-workspaces_UseOnly_databricks-control-plane-to-worker-proxy"
      priority : 102
      protocol : "tcp"
      source_address_prefix : "AzureDatabricks"
      source_address_prefixes : []
      source_application_security_group_ids : []
      source_port_range : "*"
      source_port_ranges : []
    },
    {
      access : "Allow"
      description : "Required for Databricks control plane management of worker nodes."
      destination_address_prefix : "VirtualNetwork"
      destination_address_prefixes : []
      destination_application_security_group_ids : []
      destination_port_range : "22"
      destination_port_ranges : []
      direction : "Inbound"
      name : "Microsoft.Databricks-workspaces_UseOnly_databricks-control-plane-to-worker-ssh"
      priority : 101
      protocol : "tcp"
      source_address_prefix : "AzureDatabricks"
      source_address_prefixes : []
      source_application_security_group_ids : []
      source_port_range : "*"
      source_port_ranges : []
    },
    {
      access : "Allow"
      description : "Required for worker communication with Azure Eventhub services."
      destination_address_prefix : "EventHub"
      destination_address_prefixes : []
      destination_application_security_group_ids : []
      destination_port_range : "9093"
      destination_port_ranges : []
      direction : "Outbound"
      name : "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-eventhub"
      priority : 104
      protocol : "tcp"
      source_address_prefix : "VirtualNetwork"
      source_address_prefixes : []
      source_application_security_group_ids : []
      source_port_range : "*"
      source_port_ranges : []
    },
    {
      access : "Allow"
      description : "Required for worker nodes communication within a cluster."
      destination_address_prefix : "VirtualNetwork"
      destination_address_prefixes : []
      destination_application_security_group_ids : []
      destination_port_range : "*"
      destination_port_ranges : []
      direction : "Inbound"
      name : "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-inbound"
      priority : 100
      protocol : "*"
      source_address_prefix : "VirtualNetwork"
      source_address_prefixes : []
      source_application_security_group_ids : []
      source_port_range : "*"
      source_port_ranges : []
    },
    {
      access : "Allow"
      description : "Required for worker nodes communication within a cluster."
      destination_address_prefix : "VirtualNetwork"
      destination_address_prefixes : []
      destination_application_security_group_ids : []
      destination_port_range : "*"
      destination_port_ranges : []
      direction : "Outbound"
      name : "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-outbound"
      priority : 103
      protocol : "*"
      source_address_prefix : "VirtualNetwork"
      source_address_prefixes : []
      source_application_security_group_ids : []
      source_port_range : "*"
      source_port_ranges : []
    },
    {
      access : "Allow"
      description : "Required for workers communication with Azure SQL services."
      destination_address_prefix : "Sql"
      destination_address_prefixes : []
      destination_application_security_group_ids : []
      destination_port_range : "3306"
      destination_port_ranges : []
      direction : "Outbound"
      name : "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-sql"
      priority : 101
      protocol : "tcp"
      source_address_prefix : "VirtualNetwork"
      source_address_prefixes : []
      source_application_security_group_ids : []
      source_port_range : "*"
      source_port_ranges : []
    },
    {
      access : "Allow"
      description : "Required for workers communication with Azure Storage services."
      destination_address_prefix : "Storage"
      destination_address_prefixes : []
      destination_application_security_group_ids : []
      destination_port_range : "443"
      destination_port_ranges : []
      direction : "Outbound"
      name : "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-storage"
      priority : 102
      protocol : "tcp"
      source_address_prefix : "VirtualNetwork"
      source_address_prefixes : []
      source_application_security_group_ids : []
      source_port_range : "*"
      source_port_ranges : []
    },
    {
      access : "Allow"
      description : "Required for workers communication with Databricks Webapp."
      destination_address_prefix : "AzureDatabricks"
      destination_address_prefixes : []
      destination_application_security_group_ids : []
      destination_port_range : "443"
      destination_port_ranges : []
      direction : "Outbound"
      name : "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-databricks-webapp"
      priority : 100
      protocol : "tcp"
      source_address_prefix : "VirtualNetwork"
      source_address_prefixes : []
      source_application_security_group_ids : []
      source_port_range : "*"
      source_port_ranges : []
    }
  ]

  tags = {
    environment = "dev"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg-subnet-association" {
  count = length(var.subnet_ids)
  subnet_id                 = var.subnet_ids[count.index]
  network_security_group_id = azurerm_network_security_group.dbr-nsg.id
}