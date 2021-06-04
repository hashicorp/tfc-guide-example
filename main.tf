provider "aws" {
  region = "us-east-1"
}

data "aws_rds_cluster" "cluster" {
  cluster_identifier = var.base_cluster_identifier
}

data "aws_db_instance" "instance" {
  db_instance_identifier = tolist(data.aws_rds_cluster.cluster.cluster_members)[0]
}

resource "aws_rds_cluster" "clone" {
  cluster_identifier = "${var.prefix}-${var.base_cluster_identifier}-clone"

  restore_to_point_in_time {
    source_cluster_identifier  = var.base_cluster_identifier
    restore_type               = "copy-on-write"
    use_latest_restorable_time = true
  }
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count                     = var.instances_number
  identifier                = "clone-${count.index}"
  cluster_identifier        = aws_rds_cluster.clone.id
  instance_class            = "db.r5.2xlarge"
  engine                    = "aurora-postgresql"
  db_parameter_group_name   = "custom-aurora-postgresql11-reader"
}
