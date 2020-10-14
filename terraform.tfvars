rg_name = "dev-ddp-rg"
vnet_name = "dev-ddp-vnet"
vnet_cidr_blocks = ["10.0.0.0/16"]
subnet_names = ["dev-ddp-sub-dbr-1", "dev-ddp-sub-dbr-2"]
subnet_cidr_blocks = ["10.0.1.0/24", "10.0.7.0/24"]
service_endpoints = [ "Microsoft.Sql", "Microsoft.Storage" ]