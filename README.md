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




PFB:
#create a local state file
cp terraform.tfstate terraform.tfstate.local
 
#refresh only local file
terraform apply -refresh-only -state=terraform.tfstate.local
 
#list the changes
terraform state list -state=terraform.tfstate.local
 
#tf state
terraform show terraform.tfstate > state.txt
 
aws s3 cp s3://my-bucket/example.txt ./example.txt move file from one to other
 
 
