provider "aws" {
  region = "us-east-2"
}

# create users
# 10 employees: 4 developers, 2 operations, 1 finance manager, 3 data analysts

#developers
resource "aws_iam_user" "developer1" {
  name = "cody-dev"
}
resource "aws_iam_user" "developer2" {
  name = "ryan-dev"
}
resource "aws_iam_user" "developer3" {
  name = "john-dev"
}
resource "aws_iam_user" "developer4" {
  name = "joe-dev"
}

#operations
resource "aws_iam_user" "operations1" {
  name = "dylan-ops"
}
resource "aws_iam_user" "operations2" {
  name = "tim-ops"
}

#finance
resource "aws_iam_user" "finance1" {
  name = "dave-finance"
}

# data analyst
resource "aws_iam_user" "analyst1" {
  name = "matt-analyst"
}
resource "aws_iam_user" "analyst2" {
  name = "kim-analyst"
}
resource "aws_iam_user" "analyst3" {
  name = "alex-analyst"
}

# create user groups
resource "aws_iam_group" "my_developer_group" {
  name = "developer_group"
}
resource "aws_iam_group" "my_operations_group" {
  name = "operations_group"
}
resource "aws_iam_group" "my_finance_group" {
  name = "finance_group"
}
resource "aws_iam_group" "my_analyst_group" {
  name = "analyst_group"
}

# group policies
# developer policies
resource "aws_iam_group_policy_attachment" "ec2_full_access_dev" {
    group = aws_iam_group.my_developer_group.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
resource "aws_iam_group_policy_attachment" "s3_readonly_dev" {
    group = aws_iam_group.my_developer_group.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
resource "aws_iam_group_policy_attachment" "cloudwatch_full_access_dev" {
    group = aws_iam_group.my_developer_group.name
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess"
}

# operations policies
resource "aws_iam_group_policy_attachment" "ec2_full_access_ops" {
    group = aws_iam_group.my_operations_group.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
resource "aws_iam_group_policy_attachment" "rds_full_access" {
    group = aws_iam_group.my_operations_group.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}
resource "aws_iam_group_policy_attachment" "systems_manager_full_access" {
    group = aws_iam_group.my_operations_group.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}
resource "aws_iam_group_policy_attachment" "cloudwatch_full_access_ops" {
    group = aws_iam_group.my_operations_group.name
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess"
}

#finance policies
resource "aws_iam_group_policy_attachment" "billing_access" {
    group = aws_iam_group.my_finance_group.name
    policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}
resource "aws_iam_group_policy_attachment" "readonly_access" {
    group = aws_iam_group.my_finance_group.name
    policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

# data analyst policies
resource "aws_iam_group_policy_attachment" "s3_readonly_finance" {
    group = aws_iam_group.my_analyst_group.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
resource "aws_iam_group_policy_attachment" "rds_readonly" {
    group = aws_iam_group.my_analyst_group.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess"
}

# adding users to user groups
# developers
resource "aws_iam_group_membership" "developer_group_membership" {
    name = "developer_group_membership"
    users = [ #add more
        aws_iam_user.developer1.name,
        aws_iam_user.developer2.name,
        aws_iam_user.developer3.name,
        aws_iam_user.developer4.name
    ]
    group = aws_iam_group.my_developer_group.name
}

# operations
resource "aws_iam_group_membership" "operations_group_membership" {
    name = "operations_group_membership"
    users = [ #add more
        aws_iam_user.operations1.name,
        aws_iam_user.operations2.name
    ]
    group = aws_iam_group.my_operations_group.name
}

# finance
resource "aws_iam_group_membership" "finance_group_membership" {
    name = "finance_group_membership"
    users = [ #add more
        aws_iam_user.finance1.name
    ]
    group = aws_iam_group.my_finance_group.name
}

# analyst
resource "aws_iam_group_membership" "analyst_group_membership" {
    name = "analyst_group_membership"
    users = [ #add more
        aws_iam_user.analyst1.name,
        aws_iam_user.analyst2.name,
        aws_iam_user.analyst3.name
    ]
    group = aws_iam_group.my_analyst_group.name
}