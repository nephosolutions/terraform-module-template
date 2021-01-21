# Terraform Module Template

This repository can be used to bootstrap new Terraform module repositories.

## Usage

```hcl
module "demo" {
  source  = "nephosolutions/<module-name>/<provider>"
  version = "0.1.0"

  key = "value"
  foo = var.bar
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| null | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| null | >= 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| demo | Trigger for the demo resource. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| null\_resource\_id | The ID of the demo resource. |
| null\_resource\_triggers | The triggers of the demo resource. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
