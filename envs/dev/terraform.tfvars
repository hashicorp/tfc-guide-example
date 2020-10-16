vnet_name= "ddp-test-vnet"
vnet_cidr_blocks = ["10.0.0.0/16"]
subnet_count = 2
subnet_names = ["dev-ddp-sub-dbr-1", "dev-ddp-sub-dbr-2"]
subnet_cidr_blocks = ["10.0.1.0/27", "10.0.7.0/27"]
service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"]
rg_name = "dev-ddp-rg"
rg_region = "East US 2"
