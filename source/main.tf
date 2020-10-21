terraform {
  required_version = ">= 0.12.1"
}

provider "google-beta" {

  credentials = file(var.credentials_file)

  project = var.project_id
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_bigquery_dataset" "default" {
  dataset_id    = var.dataset_id
  friendly_name = var.dataset_name != "" ? var.dataset_name : null
  description   = var.description != "" ? var.description : null
  location      = var.location

  default_table_expiration_ms = var.expiration != 0 ? var.expiration : null
  project                     = var.project_id
}

resource "google_bigquery_table" "default" {
  count       = length(var.tables)
  dataset_id  = google_bigquery_dataset.default.dataset_id
  table_id    = var.tables[count.index]["table_id"]
  project     = var.project_id
  description = var.tables[count.index]["description"] != "" ? var.tables[count.index]["description"] : null

  schema = file(
  format(
  "%s/../schemata/%s",
  path.module,
  var.tables[count.index]["schema"],
  ),
  )

  dynamic "time_partitioning" {
    for_each = lookup(var.tables[count.index], "partition_field") != "" ? [lookup(var.tables[count.index], "partition_field")] : []
    iterator = partition_field
    content {
    type  = "DAY"
    field = partition_field.value != "LOAD_TIME" ? partition_field.value : ""
    }
  }


  range_partitioning {
        field = lookup(var.tables[count.index], "range_partition_field")
        range {
        end = 100
        interval = 1
        start = 1
    }
  }

  clustering = lookup(var.tables[count.index], "clustering")

}
