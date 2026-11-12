# vpc
module "vpc" {
  source         = "../../modules/vpc"
  vpc_cidr_block = "192.168.0.0/16"
  vpc_name       = "Dev-vpc"
  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]

  public_subnet_cidrs = [
    "192.168.1.0/24",
    "192.168.2.0/24"
  ]

  private_subnet_cidrs = [
    "192.168.10.0/24",
    "192.168.11.0/24"
  ]
  enable_nat_gateway = false

}

# Front end
module "frontend" {
  source                 = "../../modules/frontendaws"
  bucket_name            = "frontend.rufneem.xyz"
  aws_origin_access_name = "Croos access from cloudfront"
  cert_domain            = "*.rufneem.xyz"
  dns_record             = "frontend.rufneem.xyz"
  hosted_zone_name       = "rufneem.xyz"

}