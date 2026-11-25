
config {
  disabled_by_default = false
  force               = false
}

# Terraform rules
plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

# Google Cloud rules
plugin "google" {
  enabled = true
  version = "0.35.0"
  source  = "github.com/terraform-linters/tflint-ruleset-google"
}
