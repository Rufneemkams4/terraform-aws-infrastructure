output "vpc_id" {
    value = aws_vpc.name.id
}

output "vpc_arn" {
    value = aws_vpc.name.arn
}

output "vpc_internet_gateway_id" {
    value = aws_internet_gateway.name.id
  
}