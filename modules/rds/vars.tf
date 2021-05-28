variable "allocated_storage" {
    type = number
    default = "20"
}

variable "engine" {
    default = "mysql"
}

variable "engine_version" {
    type = number
    default = "5.7"
}

variable "instance_class" {
    default = "db.t3.micro"
}

variable "db_name" {
    default = "dev"
}
 
variable "username" {
    default = "admin"
}

variable "password" {
    default = "fo$Tbaz@tar"
}
 
variable "parameter_group_name" {
    default = "default.mysql5.7"
} 

variable "replicate_source_db" {
  type        = string
  default     = null
}

variable "backup_retention_period" {

  type        = number
  default     = null
}