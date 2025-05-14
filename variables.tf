variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile name"
  type        = string
}

variable "user_name" {
  description = "IAM user name"
  type        = string
}

variable "role_name" {
  description = "IAM role name"
  type        = string
}

variable "sg_name" {
  description = "Security group name"
  type        = string
}

variable "cidr_ssh" {
  description = "CIDR block allowed for SSH ingress"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to attach the security group to"
  type        = string
}

variable "policy_arns" {
  description = "List of AWS managed policy ARNs"
  type        = list(string)
}

variable "custom_inline_policy_name" {
  description = "Name of the inline policy"
  type        = string
}

variable "custom_inline_policy_document" {
  description = "Custom IAM policy in JSON format"
  type        = string
}

variable "iam_user_access_key" {
  description = "Access key for IAM user (optional)"
  type        = string
  default     = ""
}

variable "iam_user_secret_key" {
  description = "Secret key for IAM user (optional)"
  type        = string
  default     = ""
}