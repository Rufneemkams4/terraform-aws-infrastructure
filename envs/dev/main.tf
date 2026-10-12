# vpc
module "vpc" {
  source         = "../../modules/vpc"
  vpc_cidr_block = "192.168.0.0/16"
  vpc_name       = "Dev-vpc"

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