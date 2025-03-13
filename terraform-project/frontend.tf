resource "aws_instance" "frontend" {
  instance_type = "t2.micro"
  ami = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = ["sg-06664a65d9522acf5"]
  tags = {
    Name = "Frontend"
  }

  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip
    }
    inline = [ "sudo pip3 install ansible", 
    "ansible-pull -i loclahost, -U https://github.com/raghudevopsb83/roboshop-ansible -e component_name=frontend" ]
  }
}

resource "aws_route53_record" "frontend_record" {
  zone_id = "Z10310253KPZLFJOC7YEK"
  name = "frontend-dev"
  ttl = 0
  type = "A"
  records = [aws_instance.frontend.public_ip]
}