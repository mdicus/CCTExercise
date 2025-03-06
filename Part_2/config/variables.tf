variable "aws_role" {
    type = object({
        arn = string
        acc = string
        region = string
    })
}

variable "acc_and_cycle" {
    type = string
}

variable "common_tags" {
    type = map
}

variable "clients" {
    type = set(string)
}