variable "role_ids" {
    type = object({
        glue_role_raw = string
        glue_role_processed = string
    })
}