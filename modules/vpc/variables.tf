variable "vpc_cidr_block" {
  description = "IPv4 CIDR block for the VPC."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr_block))
    error_message = "The VPC CIDR must be a valid IPv4 CIDR block."
  }
}

variable "vpc_tenancy" {
  description = "Instance tenancy option for the VPC."
  type        = string
  default     = "default"

  validation {
    condition     = contains(["default", "dedicated"], var.vpc_tenancy)
    error_message = "VPC tenancy must be default or dedicated."
  }
}

variable "vpc_name" {
  description = "Name tag assigned to the VPC."
  type        = string

  validation {
    condition     = length(trimspace(var.vpc_name)) > 0
    error_message = "The VPC name cannot be empty."
  }
}

variable "availability_zones" {
  description = "Availability Zones for the VPC subnets."
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) == 2 && length(distinct(var.availability_zones)) == 2
    error_message = "Provide exactly two distinct Availability Zones."
  }
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the two public subnets."
  type        = list(string)

  validation {
    condition = (
      length(var.public_subnet_cidrs) == 2 &&
      alltrue([
        for cidr in var.public_subnet_cidrs :
        can(cidrnetmask(cidr))
      ])
    )
    error_message = "Provide exactly two valid IPv4 public subnet CIDRs."
  }
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the two private subnets."
  type        = list(string)

  validation {
    condition = (
      length(var.private_subnet_cidrs) == 2 &&
      alltrue([
        for cidr in var.private_subnet_cidrs :
        can(cidrnetmask(cidr))
      ])
    )
    error_message = "Provide exactly two valid IPv4 private subnet CIDRs."
  }
}

variable "enable_nat_gateway" {
  description = "Whether to create a NAT Gateway for outbound internet access from private subnets."
  type        = bool
  default     = false
}