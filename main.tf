# resource "aws_eip" "nat_ip" {
#   vpc = true
# }

# resource "aws_nat_gateway" "nat-gw" {
#   allocation_id = aws_eip.nat_ip.id
#   subnet_id     = element(var.subnets_for_nat_gw,1)
#   tags = merge(
#     {
#       Name = format("%s", var.nat_name)
#     },
#     var.tags,
#   )
# }


resource "aws_eip" "nat_ip" {
  count = length(var.subnets_for_nat_gw)
  vpc   = true
}

resource "aws_nat_gateway" "nat-gw" {
  count = length(var.subnets_for_nat_gw)
  allocation_id = aws_eip.nat_ip[count.index].id
  subnet_id     = element(var.subnets_for_nat_gw, count.index) #var.subnets_for_nat_gw[count.index]
  tags = merge(
    {
      Name = format("%s-%d", var.nat_name,count.index+1)
    },
    var.tags,
  )
}

