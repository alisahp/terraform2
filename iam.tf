resource "aws_iam_user" "tim" { 
   name = "tim"
   path = "/"
}
resource "aws_iam_group_membership" "developers_team" { 
  name = "developers-group-membership" 
  users = [
    aws_iam_user.tim.name
  ]
  group = aws_iam_group.developers.name
}