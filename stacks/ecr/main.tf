# a private container image repository.
# see https://registry.terraform.io/modules/terraform-aws-modules/ecr/aws
# see https://github.com/terraform-aws-modules/terraform-aws-ecr
module "ecr_repository" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "2.2.0"

  for_each = var.images

  repository_name               = "${var.project}-${var.environment}/${each.key}"
  repository_type               = "private"
  repository_force_delete       = true
  repository_image_scan_on_push = false
  create_lifecycle_policy       = false
}

# see https://developer.hashicorp.com/terraform/language/resources/terraform-data
resource "terraform_data" "ecr_image" {
  for_each = var.images

  triggers_replace = {
    source_image  = "${each.value.name}:${each.value.tag}"
    target_image  = module.ecr_repository[each.key].repository_url
    target_region = var.region
  }

  provisioner "local-exec" {
    when = create
    environment = {
      ECR_IMAGE_COMMAND       = "copy"
      ECR_IMAGE_SOURCE_IMAGE  = "${each.value.name}:${each.value.tag}"
      ECR_IMAGE_TARGET_IMAGE  = module.ecr_repository[each.key].repository_url
      ECR_IMAGE_TARGET_REGION = var.region
    }
    interpreter = ["bash"]
    command     = "${path.module}/ecr-image.sh"
  }

  provisioner "local-exec" {
    when = destroy
    environment = {
      ECR_IMAGE_COMMAND       = "delete"
      ECR_IMAGE_SOURCE_IMAGE  = self.triggers_replace.source_image
      ECR_IMAGE_TARGET_IMAGE  = self.triggers_replace.target_image
      ECR_IMAGE_TARGET_REGION = self.triggers_replace.target_region
    }
    interpreter = ["bash"]
    command     = "${path.module}/ecr-image.sh"
  }
}
