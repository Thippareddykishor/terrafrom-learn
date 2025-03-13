resource "aws_instance" "mangodb" {
  instance_type = "t2.micro"
    ami = "ami-09c813fb71547fc4f"

  vpc_security_group_ids = ["sg-06664a65d9522acf5"]
  tags = {
    Name = "Mango"
  }

  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip
    }
    inline = [ "pip3 install ansible",
    "ansible-pull -i loclahost, -u https://github.com/raghudevopsb83/roboshell -e component_name=mangodb" ]
  }
}

resource "aws_route53_record" "mangodb_reecord" {
  ttl = 0
  zone_id = "Z10310253KPZLFJOC7YEK"
  type = "A"
  records = [aws_instance.mangodb.private_ip]
  name = "mango-dev"
}