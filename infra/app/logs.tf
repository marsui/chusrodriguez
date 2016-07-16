resource "aws_s3_bucket" "log_bucket" {
  bucket = "my_tf_log_bucket"
  acl = "log-delivery-write"
}
