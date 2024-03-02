generate_hcl ".tflint.hcl" {
  content {
    plugin "aws" {
      enabled = true
      version = "0.28.0"
      source  = "github.com/terraform-linters/tflint-ruleset-aws"
    }
  }
}
