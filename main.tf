resource "aws_iam_user" "mgn_user" {
  name = var.user_name
}

resource "aws_iam_user_policy" "inline_user_policy" {
  name   = var.custom_inline_policy_name
  user   = aws_iam_user.mgn_user.name
  policy = var.custom_inline_policy_document
}

resource "aws_iam_user_policy_attachment" "user_policy_attachments" {
  for_each   = toset(var.policy_arns)
  user       = aws_iam_user.mgn_user.name
  policy_arn = each.key
}

resource "aws_iam_role" "mgn_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "inline_role_policy" {
  name   = var.custom_inline_policy_name
  role   = aws_iam_role.mgn_role.name
  policy = var.custom_inline_policy_document
}

resource "aws_iam_role_policy_attachment" "role_policy_attachments" {
  for_each   = toset(var.policy_arns)
  role       = aws_iam_role.mgn_role.name
  policy_arn = each.key
}

resource "aws_security_group" "mgn_sg" {
  name        = var.sg_name
  description = "Security group for MGN migration"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr_ssh]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}