aws_role = {
    arn = "arn:aws:iam::123456789:role/CICDRole"
    acc = "123456789"
    region = "us-east-1"
}

acc_and_cycle = "dev"

common_tags = {
    Lifecycle = "dev"
    solution = "Analytics"
    repo = "CCTExercise"
}

clients = [
    "client1",
    "client2",
    "client3"
]