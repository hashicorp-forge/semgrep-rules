# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# ruleid: aws-iam-policy-document-duplicate-conditions
data "aws_iam_policy_document" "example" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity",
    ]

    effect = "Allow"

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "aaa",
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "bbb",
      ]
    }
  }
}

resource "aws_iam_policy" "example" {
  name   = "example_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.example.json
}


# ok: aws-iam-policy-document-duplicate-conditions
data "aws_iam_policy_document" "example2" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity",
    ]

    effect = "Allow"

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "aaa",
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"

      values = [
        "bbb",
      ]
    }
  }
}

# ok: aws-iam-policy-document-duplicate-conditions
data "aws_iam_policy_document" "example3" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity",
    ]

    effect = "Allow"

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "aaa",
      ]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "bbb",
      ]
    }
  }
}

# ok: aws-iam-policy-document-duplicate-conditions
data "aws_iam_policy_document" "example4" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity",
    ]

    effect = "Allow"

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "aaa",
      ]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:aud"

      values = [
        "bbb",
      ]
    }
  }
}
