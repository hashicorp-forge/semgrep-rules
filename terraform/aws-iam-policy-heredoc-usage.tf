# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "aws_iam_role" "test_role" {
  name = "test_role"
# ruleid: aws-iam-policy-heredoc-usage
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:sub": [
            "aaa", "bbb", "ccc"
          ]
        },
        "StringEquals": {
          "token.actions.githubusercontent.com:sub": [
            "bbb"
          ]
        }
      }
    }
  ]
}
EOF
}

# ok: aws-iam-policy-heredoc-usage
resource "aws_iam_role" "test_role" {
  name = "test_role"
  # invalid resource format, but just here for testing true positive case
  test = "<<EOT"
}

resource "aws_iam_policy" "policy" {
  name        = "${random_pet.pet_name.id}-policy"
  description = "My test policy"

# ruleid: aws-iam-policy-heredoc-usage
  policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListAllMyBuckets"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.bucket.arn}"
    }
  ]

}
EOT
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

# ruleid: aws-iam-policy-heredoc-usage
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:sub": [
            "aaa", "bbb", "ccc"
          ]
        },
        "StringLike": {
          "token.actions.githubusercontent.com:aud": [
            "bbb"
          ]
        }
      }
    }
  ]
}
EOF
}
