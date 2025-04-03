resource "aws_vpc_peering_connection" "expense-1" {
  count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = data.aws_vpc.default.id
  vpc_id        = aws_vpc.expense-1.id
  auto_accept   = true

  tags = merge (
    var.common_tags,
    var.vpc_peering_tags,
    {
        Name = "${local.resource_name}-default"
    }

  )
  
}