module "vpc" {
  source         = "../../modules/vpc"
  vpc_cidr_block = "172.20.0.0/16"
  vpc_name       = "Prod-vpc"
  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]

  public_subnet_cidrs = [
    "172.20.1.0/24",
    "172.20.2.0/24"
  ]

  private_subnet_cidrs = [
    "172.20.10.0/24",
    "172.20.11.0/24"
  ]
  enable_nat_gateway = false

}