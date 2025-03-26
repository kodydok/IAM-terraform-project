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