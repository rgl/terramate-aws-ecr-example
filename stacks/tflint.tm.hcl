generate_hcl ".tflint.hcl" {
  content {
    plugin "aws" {
      enabled = true
      source  = "github.com/terraform-linters/tflint-ruleset-aws"
      # renovate: datasource=github-releases depName=terraform-linters/tflint-ruleset-aws
      version = "0.30.0"
    }
  }
}
