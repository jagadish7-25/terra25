locals {
  name = "${var.instas[count.index]}.${var.domain_name}"
}