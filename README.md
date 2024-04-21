# learn-terraform
## a small repo I'm using to learn terraform and record notes

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
    - terraform will automatically encrypt the state file when remote storing is specified
    - **NOTE**: there is a "bootstrapping" process where you should specify the S3 bucket or whatever infrastructure you need to store the state remotely
  - you can configure all kinds of remote backends to store the state file https://developer.hashicorp.com/terraform/language/settings/backends/configuration

- `terraform plan`
  - takes local config and compares it with the actual state in terraform
    - avoid making any modifications to infra outside of terraform workflow ie. change something in aws gui, since this can cause terraform state to get out of sync
  - **EXAMPLE**: previously a database, a network, and 3 servers were deployed
    - then, the terraform config changes locally and a 4th server is added
    - `plan` command will notify the user that if applied, a new server will be added
- `terraform apply`
  - actually goes and makes the changes via the specified provider
    - will add the 4th server in the example above
- `terraform destroy`
  - it will destroy everything within the configuration!!!
  - **only cleanup, never run for a live project!!!**

