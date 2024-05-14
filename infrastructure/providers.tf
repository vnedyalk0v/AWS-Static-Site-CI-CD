terraform {
  required_version = ">= 1.8.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.49.0"
    }
  }

  ### Pass the variables during init time
  ### terraform init \
  ### -backend-config="bucket=${TFSTATE_BUCKET}" \
  ### -backend-config="key=${TFSTATE_KEY}" \
  ### -backend-config="region=${TFSTATE_REGION}"
  backend "s3" {
    # bucket = "your-terraform-state-bucket"
    # key    = "terraform/state"
    # region = var.region
  }
}

provider "aws" {
  region = var.region
}
