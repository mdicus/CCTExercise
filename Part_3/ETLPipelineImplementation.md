# ETL Pipeline Implementation with Glue

## Extract
The data would be extracted from each client’s S3 bucket. EventBridge can be used to trigger Glue whenever a new file is placed into the S3 bucket.

## Transform
Glue uses Pyspark to transform the data. In the first glue job between Raw and Processed, glue would be utilized to convert and normalize the CSV and JSON files into Parquet files. For the second glue job between Processed and the Analytics Ready Data, Glue would be utilized to transform the data as needed for Quicksight to be able to ingest and display the information.

## Load
The first glue job would place the data into another S3 bucket (Processed). The second glue job would put the data directly into Redshift for Quicksight to ingest.
## Advantages
- DynamicFrames can be utilized to handle schema evolution.
- Cost Efficient for Batch Processing
- Handles complex data transformations
- Serverless and Scalable, Scales Automatically

## Limitations and Mitigations
- Long Start Times : About a minute usually, adds latency that could cause delay for real time processing. Glue does have a Glue streaming job option that could reduce these delays.
- Debugging can be complicated : Glue produces a lot of logs which can be difficult to navigate if you are unfamiliar with where to look. This can be mitigated by providing good output options within the Glue script.
- High Cost for Smaller Job Runs : Ends up being very costly for any lightweight transformations. For lightweight transformations, it is generally better to use Lambda.
