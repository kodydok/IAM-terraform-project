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