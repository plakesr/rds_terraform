provider "aws" {
  region = "eu-west-1"
}

data "aws_vpc" "default" {}

data "aws_subnet_ids" "aws_db_subnet" {
    vpc_id = data.aws_vpc.default.id
}

module "rds-sg" {
  source = "./modules/sg"
  vpc_id      = data.aws_vpc.default.id

  # ingress
  
  from_port   = 3306
  to_port     = 3306
  cidr_blocks = ["0.0.0.0/0"]
  
}

module "rds-mysql" {
    source = "./modules/rds"
    allocated_storage    = 10
    engine               = "mysql"
    engine_version       = "5.7"
    instance_class       = "db.t3.micro"
    username             = "admin"
    password             = "fo$Tbaz@tar"
    parameter_group_name = "default.mysql5.7"
    backup_retention_period = 1
    
    
}

module "replica" {
  source = "./modules/rds"

  # Source database. For cross-region use db_instance_arn
  
  replicate_source_db = module.rds-mysql.db_instance_id
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  backup_retention_period = 0
  
  # Not allowed to specify a subnet group for replicas in the same region
 
}

