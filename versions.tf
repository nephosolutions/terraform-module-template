terraform {
  # Child modules declare lower bounds only (optionally with an upper cap), never ~> pins.
  # 1.7: mocked providers in terraform test.
  required_version = ">= 1.7"

  # required_providers {
  #   google = {
  #     source  = "hashicorp/google"
  #     version = ">= 6.0"
  #   }
  # }
}
