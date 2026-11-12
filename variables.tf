variable "vpc-cidr_block" {
  description = "the vpc cidr block"
  type        = string
  default     = "10.0.0.0/16"
}
variable "region_name" {
  default = "us-east-1"
}