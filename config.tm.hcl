globals {
  project     = "aws-ecr-example"
  environment = "test"

  # get the available regions with:
  #   aws ec2 describe-regions | jq -r '.Regions[].RegionName' | sort
  region = "eu-west-1"

  # images to copy into the aws account ecr registry as:
  #   ${project}-${environment}/${source_images.key}:${source_images.value.tag}
  source_images = {
    # see https://hub.docker.com/repository/docker/ruilopes/example-docker-buildx-go
    # see https://github.com/rgl/example-docker-buildx-go
    example = {
      name = "docker.io/ruilopes/example-docker-buildx-go"
      # renovate: datasource=docker depName=ruilopes/example-docker-buildx-go
      tag = "v1.11.0"
    }
    # see https://github.com/rgl/hello-etcd/pkgs/container/hello-etcd
    # see https://github.com/rgl/hello-etcd
    hello-etcd = {
      name = "ghcr.io/rgl/hello-etcd"
      # renovate: datasource=docker depName=rgl/hello-etcd registryUrl=https://ghcr.io
      tag = "0.0.1"
    }
  }
}

# see https://github.com/hashicorp/terraform
globals "terraform" {
  # renovate: datasource=github-releases depName=hashicorp/terraform
  version = "1.7.4"
}

# see https://registry.terraform.io/providers/hashicorp/aws
# see https://github.com/hashicorp/terraform-provider-aws
globals "terraform" "providers" "aws" {
  # renovate: datasource=terraform-provider depName=hashicorp/aws
  version = "5.39.0"
}
