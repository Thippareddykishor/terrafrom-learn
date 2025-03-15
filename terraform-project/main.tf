resource "aws_instance" "instance" {
  count = length(var.instances)
  instance_type = var.instance_type
  ami = var.ami

  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = "Catalogue"
  }

  # provisioner "remote-exec" {
  #   connection {
  #     type = "ssh"
  #     user = "ec2-user"
  #     password = "DevOps321"
  #     host = self.public_ip
  #   }
  #   inline = [ "pip3 install ansible",
  #   "ansible-pull -i loclahost, -u https://github.com/raghudevopsb83/roboshop-ansible -e component_name=catalogue -e env=dev" ]
  # }
}

resource "aws_route53_record" "catalogue_record" {
  zone_id = "Z10310253KPZLFJOC7YEK"
  name = "catalogue-dev"
  type = "A"
  ttl=0
  records = [aws_instance.catalogue.private_ip]
}


resource "null_resource" "catalogue" {
  provisioner "remote-exec" {
    
  
  connection {
    type = "ssh"
    user = "ec2-user"
     password = "DevOps321"
    host = aws_instance.catalogue.public_ip
  }
  inline = [ "pip3 install ansible",
     "ansible-pull -i loclahost, -u https://github.com/raghudevopsb83/roboshop-ansible -e component_name=catalogue -e env=dev" ]
   }
}