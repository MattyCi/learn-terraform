- `terraform init`
  - initializes project
  - downloads the associated provider defined in the main.tf file
- `terraform plan`
  - compares what is deployed to what is configured in your state file, and outputs the sequence of steps that will occur to provision that infrastructure.
- `terraform apply`
  - takes that set of commands and applies them
- `terraform destroy`
  - takes down the previous infrastructure

The `.terraform.lock.hcl` file contains metadata about the dependencies and providers installed within the workspace.

- Terraform Modules
  - a module allows you to "bundle up" a grouping of terraform config so that it is reusable
  - `terraform init` will pull modules into the working directory
- State File
  - contains information about every resource and data object that has been provisioned
  - if you have an incorrect state file locally you can inadvertently deploy infra you don't want
  - data objects
    - fixed data within our code or something pulled from APIs to influence how the infrastructure is provisioned
  - can possibly contain sensitive information
  - typically is stored remotely so teammates can pull down the latest state file, in something like s3 but NOT GIT
    - this is because there is oftentimes sensitive information in the state files
    - another reason is that a developer may forget to commit their state file after making changess
    - some recommended practices:
      - storing state file in s3 and configuring terraform to pull/push the state file automatically when running `terraform apply`
  - you can configure all kinds of remote backends to store the state file https://developer.hashicorp.com/terraform/language/settings/backends/configuration
