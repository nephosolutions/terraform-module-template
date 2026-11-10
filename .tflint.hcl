# https://github.com/terraform-linters/tflint-ruleset-terraform
plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

# Add the ruleset of the module's provider, pinned, e.g.:
# plugin "google" {
#   enabled = true
#   version = "0.40.0"
#   source  = "github.com/terraform-linters/tflint-ruleset-google"
# }
