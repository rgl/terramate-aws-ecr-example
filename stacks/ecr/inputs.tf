variable "project" {
  type    = string
  default = "aws-ecr-example"
}

variable "environment" {
  type    = string
  default = "test"
}

variable "stack" {
  type = string
}

# get the available locations with: aws ec2 describe-regions | jq -r '.Regions[].RegionName' | sort
variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "images" {
  type = map(object({
    name = string
    tag  = string
  }))
}
