variable "ami" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_security_group_ids" {
  default = ["sg-06664a65d9522acf5"]
}

variable "instances" {
  default = {
    mangodb=null
    frontend=null
    catalogue=null
    
  }
}

variable "zone_id" {
  default = "Z10310253KPZLFJOC7YEK"
}

variable "env" {
  default = "dev"
}