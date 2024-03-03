generate_hcl "_inputs.auto.tfvars" {
  content {
    project     = global.project
    environment = global.environment
    region      = global.region
    stack       = terramate.stack.id
    images      = global.source_images
  }
}
