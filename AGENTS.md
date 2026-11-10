# Agent instructions

This repository is a Terraform child module published to the HCP Terraform private registry of the `nephosolutions`
organization as `app.terraform.io/nephosolutions/<name>/<provider>`. It was generated from
[terraform-module-template](https://github.com/nephosolutions/terraform-module-template).

## Bootstrap checklist (new repository from the template)

Work through this once, in the first pull request, then delete this section.

1. The repository is named `terraform-<provider>-<name>` (the registry derives name and provider from it).
2. `README.md`: replace `PROVIDER` and `NAME`, describe the module, and keep the
   `# x-release-please-version` comment on the usage `version` line.
3. `.github/CODEOWNERS`: set the owning team.
4. `versions.tf`: add `required_providers` with lower bounds; `.tflint.hcl`: add the provider's ruleset, pinned.
5. Releases: a new module starts at `0.1.0`. When migrating code that already has releases, set
   `.release-please-manifest.json` to the last released version (e.g. `{".": "1.0.0"}`) and make sure that
   tag exists. To force a version, add a `Release-As: x.y.z` footer to the squash-merge commit.
6. Write the module (see the rules below), with `tests/*.tftest.hcl` for any logic.
7. Run `pre-commit run --all-files` and commit the regenerated README section.

## Rules

- Files: `main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`, plus one file per concern as it grows. The
  Apache-2.0 header lives in `main.tf` only; terraform-docs puts it into the README.
- No provider blocks; declare `configuration_aliases` if callers must pass aliased providers.
- `versions.tf`: lower bounds with an optional upper cap (`">= 6.0"`, `">= 6.0, < 8"`), never `~>`. No
  `.terraform.lock.hcl` is committed.
- `snake_case` names that describe the purpose; never `this` or `main` as a resource name.
- Variables: `description` and explicit `type`, sorted alphabetically; object types with `optional()` instead of
  `map(any)`; `nullable = false` and `[]`/`{}` defaults for collections; `validation` for enums, ranges and formats;
  `sensitive = true` for secrets.
- Outputs: `description`, sorted alphabetically; collections are maps keyed like the `for_each`; no whole resource
  objects.
- `for_each` with keys known at plan time; `count` only as an on/off switch.
- Resource addresses are part of the contract: renaming one needs a `moved` block.
- Tests: plan-only `terraform test` with `mock_provider`, asserting on keys, counts and validations, not computed IDs.
  No `examples/` directory and no Terratest unless the owner asks for it.
- Never edit the section between `<!-- BEGIN_TF_DOCS -->` and `<!-- END_TF_DOCS -->`; pre-commit regenerates it.

## Commits and releases

- Pull requests are squash-merged; the PR title becomes the commit and must follow
  [Conventional Commits](https://www.conventionalcommits.org) (`feat:`, `fix:`, `docs:`, `chore:`, ...). The
  "PR Title" check enforces it.
- release-please turns merged commits into a release PR (version bump, `CHANGELOG.md`, README usage version).
  Merging that PR tags `vX.Y.Z`, and HCP Terraform publishes the tag to the private registry.
- Semver: `fix` → patch, `feat` → minor, `feat!`/`BREAKING CHANGE:` → major. A breaking change is a removed or renamed
  variable or output, a new required variable, a changed resource address without a `moved` block, or a raised
  minimum Terraform or provider version.

## Checks

CI (`.github/workflows/checks.yaml`) runs the same static checks as tfc-organization's shared workflows; required
checks are "Terraform Checks", "YAML Lint" and "PR Title". Locally:

```shell
terraform fmt -recursive
terraform init -backend=false
terraform validate
tflint --init && tflint
terraform test            # if tests/ exists
pre-commit run --all-files
```

Never run `terraform apply` or `destroy` from this repository; it has no workspace.
