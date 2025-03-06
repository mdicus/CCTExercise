# Infrastructure as Code
## Structure of Code
While I did not create code for every resource required from the design diagram, I wanted to create a few modules to show the best practices of code structure. First, I created a KMS for each agency to use that would be utilized to encrypt the data within the S3 buckets. Using modules, I then created an S3 bucket per agency for Raw and for Processed. Within the IAM module, I created a basic role for the glue jobs that could be modified to include any other needed permissions while keeping in line with the rule of least privilege. The basic permissions include access to the S3 bucket and to the KMS key. In lieu of creating code for the remainder of the resources, here is a list of resources that I would expect to need in order to implement my design diagram.

### Resources: 
AWS Redshift Tables per Client
AWS Quicksight Datasets and Dashboards
AWS Kinesis Streams
AWS Cloudwatch Log Groups
AWS EventBridge Rules and Triggers
AWS Glue Data Catalog Crawlers
AWS Lakeformation Resources and Permissions

## Tagging
Tagging is incorporated into IaC using the common_tags variable defined within the deployment specific variables (within tf_vars/dev.auto.tfvars).These tags are added to all resources and can be joined with additional resource specific variables such as the client name as needed. These common tags would typically include the environment, owner, and application. Tagging properly and consistently helps for cost tracking purposes. I personally also like to add the repository name to the common tags for faster troubleshooting.

## Error Handling
Error handling in resources would be handled by sending an event to EventBridge that could be processed by a lambda. In previous projects, we utilized AWS Quicksight to create a dashboard that displayed all our error messages on one screen so that we could view all points of the pipeline at the same time. Cloudwatch alarms in combination with SNS can also be used to send text messages or email about various points of the pipeline.

## Documentation
README files should be included at the base of each repository explaining the purpose and layout of the repository. These files should also include some information about what type of resources exist in the repository and the outputs that are able to be used in other workspaces. For Terraform, modules should also be described in the README if they are able to be reused for other purposes.
