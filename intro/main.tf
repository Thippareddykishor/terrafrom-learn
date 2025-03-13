variable "x" {
    default = 10
  }

output "x" {
  value = var.x
}

output "x11" {
  value = "${var.x}"
}

#different data types
variable "y" {
  default = [1,"abc",0.3,false]
}

output "y1" {
  value = var.y[3]
}

#map
variable "z" {
  default = {
    name = "john"
    age=20
  }
}

output "z1" {
  value = "Name ${var.z["name"]}, Age ${var.z.age}"
}

variable "input" {}

output "input" {
  value = var.input
}

variable "class" {}

output "class" {
  value = var.class
}

variable "trainer" {}

output "trainer" {
    value = var.trainer
}