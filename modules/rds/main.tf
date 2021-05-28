resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  replicate_source_db  = var.replicate_source_db
  skip_final_snapshot  = true
  apply_immediately   = true
  backup_retention_period = var.backup_retention_period

}

