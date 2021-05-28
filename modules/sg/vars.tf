variable "vpc_id" {}
variable "from_port" {
    default = 3306
}

variable "to_port" {
    default = 3306
}

variable "cidr_blocks" {
    default     = ["0.0.0.0/0"]
}

