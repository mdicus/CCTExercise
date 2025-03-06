resource "aws_kms_key" "s3_kms" {}

resource "aws_kms_alias" "s3_kms" {
    name = "alias/${client}-kms"
    target_key_id = aws_kms_key.s3_kms.key_id
}