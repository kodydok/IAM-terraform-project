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