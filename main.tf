# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "google" {
  project = "cashcow-test-for-migration"
}

resource "google_redis_instance" "my_memorystore_redis_instance" {
  name           = "cashcow-redis"
  tier           = "BASIC"
  memory_size_gb = 1
  region         = "asia-east1"
  redis_version  = "REDIS_6_X"
}