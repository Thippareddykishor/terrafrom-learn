resource "aws_instance" "frontend" {
  instance_type = var.instance_type
  ami = var.ami
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = "Frontend"
  }

  # provisioner "remote-exec" {
  #   connection {
  #     type = "ssh"
  #     user = "ec2-user"
  #     password = "DevOps321"
  #     host = self.public_ip
  #   }
  #   inline = [ "sudo pip3 install ansible", 
  #   "ansible-pull -i loclahost, -U https://github.com/raghudevopsb83/roboshop-ansible -e component_name=frontend -e env=dev" ]
  # }
}

resource "aws_route53_record" "frontend_record" {
  zone_id = "Z10310253KPZLFJOC7YEK"
  name = "frontend-dev"
  ttl = 0
  type = "A"
  records = [aws_instance.frontend.public_ip]
}

#provisions run on only on resources

resource "null_resource" "frontend" {
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