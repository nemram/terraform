resource "aws_route53_record" "example" {
  zone_id = "Z0701750NA1M7W85OOPQ"
  name    = "mon.nemramos.com"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_alb.example.dns_name}"]
}