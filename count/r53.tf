resource "aws_route53_record" "expense" {
  count = length(var.instas)
  zone_id = var.host_zone
  name    =  local.name
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[count.index].private_ip]
}