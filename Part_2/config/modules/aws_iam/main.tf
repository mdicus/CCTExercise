resource "aws_iam_role" "glue_role_raw" {
    name = "${var.acc_and_cycle}-glue_role"

    tags = var.common_tags
    assume_role_policy = <<EOF
    {
        "Version" : "2012-10-17",
        "Statement" : [
            {
                "Action" : "sts:AssumeRole",
                "Principal": {
                    "Service": ["glue.amazonaws.com"]
                },
                "Effect" : "Allow"
            }
        ]
    }
    EOF
}

resource "aws_iam_policy" "s3_interact_raw" {
    name = "s3_interact_raw"
    tags = var.common_tags

    policy = <<EOF
    {
        "Version" : "2012-10-17",
        "Statement" : [
            {
                "Effect" : "Allow",
                "Action" : [
                    "s3:PutObject",
                    "s3:ListBucket",
                    "s3:GetObject"
                ],
                "Resource": [
                    #Need to List All Raw Buckets Here
                    "arn:aws:s3:::${var.bucket_name}/*",
                    "arn:aws:s3:::${var.bucket_name}",
                ]
            },
            {
                "Effect" : "Allow",
                "Action" : [
                    "kms:Encrypt",
                    "kms:Decrypt",
                    "kms:GenerateDataKey"
                ],
                "Resource": [
                    #Need to List All KMS Keys Here
                    "${var.s3_kms}"
                ]
            }
        ]
    }
}

resource "aws_iam_role_policy_attachment" "s3_interact_raw" {
    role = aws_iam_role.glue_role_raw.name
    policy_arn = aws_iam_policy.s3_interact_raw.arn
}

resource "aws_iam_role" "glue_role_processed" {
    name = "${var.acc_and_cycle}-glue_role"

    tags = var.common_tags
    assume_role_policy = <<EOF
    {
        "Version" : "2012-10-17",
        "Statement" : [
            {
                "Action" : "sts:AssumeRole",
                "Principal": {
                    "Service": ["glue.amazonaws.com"]
                },
                "Effect" : "Allow"
            }
        ]
    }
    EOF
}

resource "aws_iam_policy" "s3_interact_processed" {
    name = "s3_interact_raw"
    tags = var.common_tags

    policy = <<EOF
    {
        "Version" : "2012-10-17",
        "Statement" : [
            {
                "Effect" : "Allow",
                "Action" : [
                    "s3:PutObject",
                    "s3:ListBucket",
                    "s3:GetObject"
                ],
                "Resource": [
                    #Need to List All Raw Buckets Here
                    "arn:aws:s3:::${var.bucket_name}/*",
                    "arn:aws:s3:::${var.bucket_name}",
                ]
            },
            {
                "Effect" : "Allow",
                "Action" : [
                    "kms:Encrypt",
                    "kms:Decrypt",
                    "kms:GenerateDataKey"
                ],
                "Resource": [
                    #Need to List All KMS Keys Here
                    "${var.s3_kms}"
                ]
            }
        ]
    }
}

resource "aws_iam_role_policy_attachment" "s3_interact_processed" {
    role = aws_iam_role.glue_role_raw.name
    policy_arn = aws_iam_policy.s3_interact_raw.arn
}