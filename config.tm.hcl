globals {
  project     = "aws-ecr-example"
  environment = "test"

  # get the available regions with:
  #   aws ec2 describe-regions | jq -r '.Regions[].RegionName' | sort
  region = "eu-west-1"
}

# see https://github.com/hashicorp/terraform
globals "terraform" {
  version = "1.7.4"
}

# see https://registry.terraform.io/providers/hashicorp/aws
# see https://github.com/hashicorp/terraform-provider-aws
globals "terraform" "providers" "aws" {
  version = "5.35.0"
}
