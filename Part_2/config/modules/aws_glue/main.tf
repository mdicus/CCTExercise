resource "aws_glue_job" "format_raw" {
    name = "format_raw"
    role_arn = var.role_ids.glue_role_raw
    glue_version = "4.0"

    worker_type = "G.1X"
    number_of_workers = 10 #this can change depending on the expected quantity of data
    timeout = 720

    command {
        #assume script has been stored in S3
        script_location = "s3://${var.bucket_names.glue_scripts}/format_raw.py"
        python_version = 3
    }

    default_arguments = {
        "--enable-continous-cloudwatch-log" = "true",
        "--enable-metrics" = "true",
        "--enable-spark-ui" = "true",
        "--enable-auto-scaling" = "true",
        "--enable-glue-datacatalog" = "true"
    }
}

resource "aws_glue_job" "format_processed" {
    name = "format_processed"
    role_arn = var.role_ids.glue_role_processed
    glue_version = "4.0"

    worker_type = "G.1X"
    number_of_workers = 10 #this can change depending on the expected quantity of data
    timeout = 720

    command {
        #assume script has been stored in S3
        script_location = "s3://${var.bucket_names.glue_scripts}/format_processed.py"
        python_version = 3
    }

    default_arguments = {
        "--enable-continous-cloudwatch-log" = "true",
        "--enable-metrics" = "true",
        "--enable-spark-ui" = "true",
        "--enable-auto-scaling" = "true",
        "--enable-glue-datacatalog" = "true"
    }
}