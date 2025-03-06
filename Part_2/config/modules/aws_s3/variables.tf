variable "kms_key" {
    type = string
}

variable "bucket_name" {
    type = string
}

variable "retention_days" {
    type = string
}

variable "common_tags" {
    type = map
}