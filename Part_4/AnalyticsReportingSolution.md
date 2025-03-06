# Analytics and Reporting Solution

## Approach to Implementing an Analytics Solution
For my design, I chose to implement Quicksight as the analytics solution. Quicksight can pull data directly from Redshift and easily create dashboards to summarize key performance indicators for the data. Quicksight can also be used by the start up company to create dashboards to monitor the data pipeline to ensure data quality and efficiency. Additionally, AWS provides templates for creating dashboards to monitor cost information throughout the account. 

## Key Considerations 
- Performance vs. Cost: It is important for the start up to provide real time data due to the continuous stream of data from the client, while also considering what services are the most cost efficient.
- Ease of Integration: Quicksight is an AWS service, therefore it directly connects into other AWS services easily. Quicksight also interacts with IAM and can have different permissions enforced for each dashboard and dataset. Quicksight can also easily be embedded within a website or application.
- Security: As previously mentioned, Quicksight integrates with IAM, providing fine grained permissions for use within the application.

## Tradeoffs
- Scalability: Quicksight does have issues with processing and displaying large amounts of data. This can be mitigated by performing costly transformations using Glue before ingesting the data into Quicksight.
- Advanced Transformations: Quicksight lacks advanced features that may be found in Third Party options.
