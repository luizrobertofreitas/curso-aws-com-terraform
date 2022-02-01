// All values inside the terraform block are not in variables due to the execution sequence. This block is executed before all
// items: variables, locals, etc
terraform {
  required_version = "0.14.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }

  backend "s3" {
    // Commented the information bellow due to the methodology of passing this values
    // First: $ terraform init -backend=true -backend-config="bucket=tfstate-123123" -backend-config="key=/dev/folder/terraform.tfstate"
    // Second:
    // Using a HCL file: backend.hcl and executing the line: $ terraform init -backend=true -backend-config="backend.hcl"

    // bucket = "tfstate-<account number>"
    // key = "path/to/my/key"
    // region = "us-east-1"
    // profile = "default"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
