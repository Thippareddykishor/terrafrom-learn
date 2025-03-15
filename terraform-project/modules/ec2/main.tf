resource "aws_instance" "ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_id
  tags = {
    Name = var.name
  }
}

resource "aws_route53_record" "route_record" {
  name = "${var.name}-${var.env}"
  zone_id = var.zone_id
  type = "A"
  ttl = 0
  records = [aws_instance.ec2.private_ip]
}