resource "aws_instance" "mangodb" {
  instance_type = var.instance_type
    ami = var.ami

  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = "Mango"
  }

  # provisioner "remote-exec" {
  #   connection {
  #     type = "ssh"
  #     user = "ec2-user"
  #     password = "DevOps321"
  #     host = self.public_ip
  #   }
  #   inline = [ "pip3 install ansible",
  #   "ansible-pull -i loclahost, -u https://github.com/raghudevopsb83/roboshop-ansible -e component_name=mangodb -e env=dev" ]
  # }
}

resource "aws_route53_record" "mangodb_reecord" {
  ttl = 0
  zone_id = "Z10310253KPZLFJOC7YEK"
  type = "A"
  records = [aws_instance.mangodb.private_ip]
  name = "mango-dev"
}

resource "null_resource" "mangodb" {
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.mangodb.public_ip
    }
    inline = [ "sudo pip3.11 install ansible",
    "ansible-pill -i localhost, -U https://github.com/raghudevopsb83/roboshop-ansible -e component_name=frontend -e env=dev" ]
  }
}