resource "aws_s3_bucket" "s3_bucket" {
    bucket_prefix = var.bucket_name
    tags = merge(
        var.common_tags,
        {
            Client = var.client
        }
    )
}

resource "aws_s3_server_side_encryption_configuration" "encryption" {
    bucket = aws_s3_bucket.s3_bucket.id

    rule {
        bucket_key_enabled = true #reduces cost associated with kms
        apply_server_side_encryption_by_default {
            kms_master_key_id = var.kms_key
            sse_algorithm = "aws:kms"
        }
    }
}

resource "aws_s3_bucket_public_access_block" "no_public_access"{
    bucket = aws_s3_bucket.s3_bucket.id
    block_public_acls = true
    block_public_policy = true
    restrict_public_buckets = true
    ignore_public_acls = true
}

#enables the bucket to send events to EventBridge
resource "aws_s3_bucket_notification" "events"{
    bucket = aws_s3_bucket.s3_bucket.id
    eventbridge = true
}

#can be configured depending on needs
resource "aws_s3_bucket_lifecycle_configuration" "RetentionPolicy" {
    bucket = aws_s3_bucket.s3_bucket.id

    rule{
        id = "RetentionPolicy"
        expiration{
            days = var.retention_days
        }
        status = "Enabled
    }

}