# AWS MGN Setup using Terraform

This Terraform project automates the creation of:

- IAM user and role for AWS MGN (Migration Hub)
- Security group for MGN
- Managed and inline policies for both user and role

## Usage

1. Fill in the required values in `terraform.tfvars`.
2. Initialize and apply the Terraform configuration:

```bash
terraform init
terraform plan
terraform apply
```

## Security

Make sure you do **NOT** commit `terraform.tfvars` or secrets to version control.