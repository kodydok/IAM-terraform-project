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