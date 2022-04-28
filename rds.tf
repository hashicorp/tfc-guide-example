resource "aws_rds_cluster" "app1-rds-cluster" {
  cluster_identifier      = "app1-rds-cluster"
  engine = "aurora"
  backup_retention_period = 0
  storage_encrypted = "false"
}
