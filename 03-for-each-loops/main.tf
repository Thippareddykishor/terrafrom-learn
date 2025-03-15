resource "null_resource" "name" {
  for_each = var.x

provisioner "local-exec" {
  command = "echo ${each.key} = ${each.value}"
}
}

variable "x" {
  default = {
    x=100
    j=200
  }
}