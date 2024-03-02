generate_hcl "_providers.tf" {
  content {
    terraform {
      required_version = global.terraform.version
      required_providers {
        # see https://registry.terraform.io/providers/hashicorp/aws
        # see https://github.com/hashicorp/terraform-provider-aws
        aws = {
          source  = "hashicorp/aws"
          version = global.terraform.providers.aws.version
        }
      }
    }

    provider "aws" {
      region = var.region
      default_tags {
        tags = {
          Project     = var.project
          Environment = var.environment
          Stack       = var.stack
        }
      }
    }
  }
}
