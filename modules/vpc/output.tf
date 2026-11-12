output "vpc_id" {
  value = aws_vpc.name.id
}

output "vpc_arn" {
  value = aws_vpc.name.arn
}

output "vpc_internet_gateway_id" {
  value = aws_internet_gateway.name.id

}

output "public_subnet_ids" {
  description = "IDs of the public subnets, keyed by Availability Zone."

  value = {
    for az, subnet in aws_subnet.public :
    az => subnet.id
  }
}

output "private_subnet_ids" {
  description = "IDs of the private subnets, keyed by Availability Zone."

  value = {
    for az, subnet in aws_subnet.private :
    az => subnet.id
  }
}

output "public_route_table_id" {
  description = "ID of the public route table."
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "ID of the private route table."
  value       = aws_route_table.private.id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway, or null when disabled."
  value       = try(aws_nat_gateway.name[0].id, null)
}

output "nat_gateway_enabled" {
  description = "Whether the NAT Gateway is enabled."
  value       = var.enable_nat_gateway
}