test_tables = [
  {
    "table_id"                 = "test",
    "schema"                   = "test.json",
    "description"              = "test"
    "partition_field"          = "",
    "range_partition_field"    = "",
    "range_partition_interval" = ""
    "range_partition_start"    = ""
    "range_partition_end"      = ""
    "clustering"               = []
  },
  {
    "table_id"                 = "bikeshare_stations",
    "schema"                   = "bikeshare_stations.json",
    "description"              = "range partitioned test data",
    "partition_field"          = "",
    "range_partition_field"    = "station_id",
    "range_partition_interval" = 1,
    "range_partition_start"    = 1,
    "range_partition_end"      = 10000,
    "clustering"               = []
  }
]