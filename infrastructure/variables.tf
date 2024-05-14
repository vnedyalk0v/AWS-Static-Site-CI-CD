variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"

  validation {
    condition     = can(regex("^((us|af|ap|ca|cn|eu|me|sa)-(east|west|south|southeast|northeast|central|north|northwest)-(1|2|3))$", var.region))
    error_message = "The specified region is not a valid AWS region."
  }
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string

  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && can(regex("^[a-z0-9](?:[a-z0-9.-]{1,61}[a-z0-9])?$", var.bucket_name)) && !contains(var.bucket_name, "..") && !can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", var.bucket_name)) && !can(regex("^xn--", var.bucket_name)) && !can(regex("^sthree-", var.bucket_name)) && !can(regex("-s3alias$", var.bucket_name)) && !can(regex("--ol-s3$", var.bucket_name))
    error_message = "The bucket name does not conform to AWS bucket naming rules."
  }
}

variable "domain_name" {
  description = "Domain name for the website"
  type        = string

  validation {
    condition     = length(var.domain_name) >= 1 && length(var.domain_name) <= 253 && can(regex("^(?!-)[A-Za-z0-9-]{1,63}(?<!-)(\\.[A-Za-z]{2,})+$", var.domain_name))
    error_message = "The domain name does not conform to valid domain naming rules."
  }
}

variable "acm_validation_method" {
  description = "ACM certificate validation method"
  type        = string
  default     = "DNS"

  validation {
    condition     = contains(["DNS", "EMAIL"], var.acm_validation_method)
    error_message = "The only valid options for acm_validation_method are 'DNS' or 'EMAIL'."
  }
}
