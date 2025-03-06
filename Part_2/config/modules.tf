module "glue" {
    source = "./modules/aws_glue"
}

module "iam" {
    source = "./modules/aws_iam"
}

module "kms" {
    source = "./modules/aws_kms"
}

module "redshift" {
    source = "./modules/aws_redshift"
}

module "raw_s3" {
    for_each = var.clients
    source = "./modules/aws_s3"

}

module "process_s3" {
    for_each = var.clients
    source = "./modules/aws_s3"
    
}