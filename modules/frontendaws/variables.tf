variable "bucket_name" {
  description = "Bucket name"
}

variable "aws_origin_access_name" {

}

variable "cloudfront_default_object" {
  default = "index.html"
}

variable "cloudfront_origin_id" {
  default = "S3-terraform.rufneem.xyz"
}

variable "cert_domain" {

}

variable "dns_record" {

}

variable "hosted_zone_name" {

}