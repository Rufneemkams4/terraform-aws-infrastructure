module "vpc" {
  source         = "../../modules/vpc"
  vpc_cidr_block = "192.168.0.0/16"
  vpc_name       = "Dev-vpc"

}