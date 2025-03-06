output "role_ids" {
    value = {
        glue_role_raw = aws_iam_role.glue_role_raw.arn
        glue_role_processed = aws_iam_role.glue_role_processed.arn
    }
}