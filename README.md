# Simplest Amazon S3 - Ruby

The simplest way to send upload files to Amazon Web Service: Simple Storage Service - AWS:S3.

# How to test

  1. git clone...
  1. Start an terminal on this project directory
  1. Install dependencies with command: bundle install
  1. Start Rack with command: ACCESS_KEY_ID=YOUR_ACCESS_KEY SECRET_ACCESS_KEY=YOUR_SECRET BUCKET_NAME=YOUR_BUCKET rackup
  1. Open browser at: http://localhost:9292

This page allows upload a file to informed AWS bucket.

# How to config Amazon S3 Bucket

1. Create a new user, using AIM
1. Create a bucket on S3
1. Config your bucket access:

```json
{
    "Version": "2012-10-17",
    "Id": "<< UNIQUE_NAME_bucket_policy >>",  <== Give a name to this bucket policy
    "Statement": [
        {
            "Sid": "<< UNIQUE_NAME_bucket >>", <= Give a name to this bucket policy
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::..."  <===== <User ARN do IAM>
            },
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::..." <===== <Bucket ARN>
        },
        {
            "Sid": "NOME_ÚNICO_bucket_files",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::..." <====== <User ARN do IAM>
            },
            "Action": [
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Resource": "arn:aws:s3:::.../" <==== <Bucket ARN>/
        }
    ]
}
```
