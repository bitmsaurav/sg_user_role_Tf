aws_region  = "us-east-1"
aws_profile = "your-aws-profile-name"

user_name = "ngl-cap-mgn-user"
role_name = "ngl-cap-mgn-role"
sg_name   = "ngl-cap-mgn-sg"

vpc_id    = "vpc-xxxxxxxx"
cidr_ssh  = "0.0.0.0/0"

policy_arns = [
  "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
  "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
  "arn:aws:iam::aws:policy/AWSApplicationMigrationAgentInstallationPolicy",
  "arn:aws:iam::aws:policy/AWSApplicationMigrationAgentPolicy",
  "arn:aws:iam::aws:policy/AWSApplicationMigrationFullAccess",
  "arn:aws:iam::aws:policy/AWSElasticDisasterRecoveryAgentInstallationPolicy"
]

custom_inline_policy_name = "CustomEC2Policy"

custom_inline_policy_document = jsonencode({
  Version = "2012-10-17",
  Statement = [
    {
      Effect = "Allow",
      Action = [
        "ec2:DescribeInstances",
        "ec2:StartInstances",
        "ec2:StopInstances"
      ],
      Resource = "*"
    }
  ]
})

iam_user_access_key = ""
iam_user_secret_key = ""