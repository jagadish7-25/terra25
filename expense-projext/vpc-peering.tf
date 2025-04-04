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

resource "aws_route" "public_perring" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.public-r.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.expense-1[count.index].id
}
resource "aws_route" "private_perring" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.private-r.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.expense-1[count.index].id
}
resource "aws_route" "database_perring" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.database-r.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.expense-1[count.index].id
}
# resource "aws_route" "default_perring" {
#   count = var.is_peering_required ? 1 : 0
#   route_table_id            = aws_route_table.database-r.id
#   destination_cidr_block    = data.aws_vpc.default.cidr_block
#   vpc_peering_connection_id = aws_vpc_peering_connection.expense-1[count.index].id
# }