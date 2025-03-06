terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.89"
        }
    }
}

provider "aws" {
    region = var.aws_role.region
    assume_role {
        role_arn = var.aws_role.arn
    }
}