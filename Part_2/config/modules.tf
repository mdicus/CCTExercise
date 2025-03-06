module "glue" {
    source = "./modules/aws_glue"
    role_ids = module.iam.role_ids
}

module "iam" {
    source = "./modules/aws_iam"
    acc_and_cycle = var.acc_and_cycle
}

# create a KMS key per client
module "kms" {
    for_each = var.clients
    source = "./modules/aws_kms"
    client = "${each.key}"
}

#create a Raw Bucket per client using the client specific KMS key
module "raw_s3" {
    for_each = var.clients
    source = "./modules/aws_s3"
    kms_key = module.kms.s3_kms["${each.key}"]
    bucket_name = "raw"
    retention_days = "30"
    common_tags = var.common_tags
}

#create a Processed Bucket per client using the client specific KMS key
module "process_s3" {
    for_each = var.clients
    source = "./modules/aws_s3"
    kms_key = module.kms.s3_kms["${each.key}"]
    bucket_name = "processed"
    retention_days = "30"
    common_tags = var.common_tags
}