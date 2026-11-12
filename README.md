# Terraform AWS Infrastructure as Code

## Overview

This repository demonstrates Infrastructure as Code (IaC) practices using Terraform to define and manage AWS infrastructure.

The project includes reusable Terraform modules, separate development and production configurations, and exercises involving Terraform resource imports.

The goal is to demonstrate practical Cloud Engineering and DevOps skills, including modular infrastructure design, network configuration, infrastructure validation, and CI/CD automation.

## Architecture

The reusable VPC module defines:

- An AWS Virtual Private Cloud (VPC)
- Two public subnets across two Availability Zones
- Two private subnets across two Availability Zones
- An Internet Gateway
- Public and private route tables
- Route table associations
- An optional NAT Gateway with Elastic IP
- Outputs for networking resources

The NAT Gateway is disabled by default to avoid unnecessary infrastructure costs.

**Note:** The current implementation uses a single NAT Gateway when enabled. A production high-availability design should consider one NAT Gateway per Availability Zone.

## AWS Services

- Amazon VPC
- Amazon EC2
- Amazon S3
- Amazon CloudFront
- Amazon Route 53
- AWS Certificate Manager (ACM)
- AWS Internet Gateway and NAT Gateway

These services are represented in the repository's Terraform configurations; they are not necessarily deployed.

## Repository Structure

```text
terraform-14/
├── main.tf
├── variables.tf
├── output.tf
├── backend.tf
├── appfrontend.tf
├── appbackend.tf
├── data.tf
├── version.tf
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── output.tf
│   └── frontendaws/
├── envs/
│   ├── dev/
│   └── prod/
├── terraform-import/
└── README.md
```

## Prerequisites

- Terraform CLI
- Git
- AWS CLI for AWS-related operations
- AWS credentials and permissions only when performing authenticated AWS operations

## Local Validation

Format the Terraform configuration:

```bash
terraform fmt -recursive
```

Initialize the development configuration without connecting to a remote backend:

```bash
cd envs/dev
terraform init -backend=false
terraform validate
```

Validate production:

```bash
cd ../prod
terraform init -backend=false
terraform validate
```

These commands do not deploy AWS resources.

## Terraform State Management

The root configuration includes an Amazon S3 backend with state encryption and native S3 locking enabled.

Terraform state files must not be committed to Git.

Backend configuration and state management should be reviewed before any real deployment.

## Security and Cost Considerations

- Terraform state files and sensitive variable values should not be committed.
- The NAT Gateway is disabled by default.
- Network configurations use public and private subnet separation.
- Production environments require additional security and high-availability review.
- AWS resources may incur charges if deployed.

## CI/CD

**Planned:** GitHub Actions pipeline for Terraform formatting, initialization, validation, and security scanning.

The validation pipeline will not run `terraform apply` or deploy AWS infrastructure.

## Project Status

The reusable VPC module has been implemented and successfully validated in the development and production configurations.

Additional infrastructure review and GitHub Actions CI integration are planned.
