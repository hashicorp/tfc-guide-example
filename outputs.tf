# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "host" {
 description = "The IP address of the instance."
 value = "${google_redis_instance.my_memorystore_redis_instance.host}"
}