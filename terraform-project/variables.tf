//variable "ami_id" {}
variable "vpc_security_group_ids" {}
variable "instances" {}
variable "zone_id" {}
variable "env" {}
variable "eks" {}

# variable "instances" {
#   default = {
#     frontend={
#         ami_id="ami-09c813fb71547fc4f"
#         instance_type="t2.micro"
#     }
#     catalogue ={
#         ami_id="ami-09c813fb71547fc4f"
#         instance_type="t2.micro"
#     }
#     mongodb={
#         ami_id="ami-09c813fb71547fc4f"
#         instance_type="t2.micro"
#     }

#   }
# }

# variable "zone_id" {
#   default = "Z10310253KPZLFJOC7YEK"
# }

# variable "env" {
#   default = "dev"
# }

# variable "vpc_security_group_ids" {
#   default = ["sg-06664a65d9522acf5"]
# }