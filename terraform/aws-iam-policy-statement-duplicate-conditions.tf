# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "aws_iam_role" "github_action_mirror_repos_role" {
  name = "github_action_mirror_repos_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
# ruleid: aws-iam-policy-statement-duplicate-conditions
    Statement = [
      {},
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "${aws_iam_openid_connect_provider.github_provider.arn}"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "Foo": {},
          "StringEquals" : {
            "token.actions.githubusercontent.com:sub" : [
              "repo:orgname/reponame:ref:refs/heads/main"
            ]
          },
          "Folo": {},
          "StringEquals" : {
            "token.actions.githubusercontent.com:aud" : "${one(aws_iam_openid_connect_provider.github_provider.client_id_list)}"
          },
          "Food": {}
        }
      },
      {}
    ]
  })
}

resource "aws_iam_role" "github_action_mirror_repos_role" {
  name = "github_action_mirror_repos_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
# ruleid: aws-iam-policy-statement-duplicate-conditions
    Statement = [
      {},
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "${aws_iam_openid_connect_provider.github_provider.arn}"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringEquals" : {
            "token.actions.githubusercontent.com:sub" : [
              "repo:orgname/reponame:ref:refs/heads/main"
            ]
          },
          "StringEquals" : {
            "token.actions.githubusercontent.com:aud" : "${one(aws_iam_openid_connect_provider.github_provider.client_id_list)}"
          }
        }
      },
      {}
    ]
  })
}

resource "aws_iam_role" "github_action_mirror_repos_role_2" {
  name = "github_action_mirror_repos_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
# ok: aws-iam-policy-statement-duplicate-conditions
    Statement = [
      {},
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "${aws_iam_openid_connect_provider.github_provider.arn}"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "Foo": {},
          "StringLike" : {
            "token.actions.githubusercontent.com:sub" : [
              "repo:orgname/reponame:ref:refs/heads/main"
            ]
          },
          "Folo": {},
          "StringEquals" : {
            "token.actions.githubusercontent.com:aud" : "${one(aws_iam_openid_connect_provider.github_provider.client_id_list)}"
          },
          "Food": {}
        }
      },
      {}
    ]
  })
}
