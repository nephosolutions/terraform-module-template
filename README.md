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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.demo](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_demo"></a> [demo](#input\_demo) | Trigger for the demo resource. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_null_resource_id"></a> [null\_resource\_id](#output\_null\_resource\_id) | The ID of the demo resource. |
| <a name="output_null_resource_triggers"></a> [null\_resource\_triggers](#output\_null\_resource\_triggers) | The triggers of the demo resource. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
