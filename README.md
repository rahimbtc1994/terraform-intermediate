# Part 1 : IaC

## IaC
Infrastructure as Code (IaC) is a practice where you manage and provision your computing infrastructure using configuration files instead of manual processes.

## Why IaC
1. `Automation & Consistency`: By automating the setup and configuration, you ensure that every environment is consistent and that manual errors are minimized.
2. `Version Control`: IaC files can be stored in version control systems (like Git), enabling tracking of changes, collaboration, and rollbacks.
3. `Declarative vs. Imperative`:
    - `Declarative`: You describe the desired end state (e.g., using tools like Terraform or AWS CloudFormation), and the system figures out the steps to achieve that state.
    - `Imperative`: You explicitly write the commands needed to achieve the final state (e.g., using shell scripts or configuration management tools like Ansible).
4. `Speed & Agility`: Automating infrastructure deployments accelerates development, testing, and production processes, which is a key principle in DevOps.

5. Infrastructure provisioned via GUI --> API/CLI --> IaC tools

## Categories
1. Ad-hoc scripts
2. Configuration management tools (Ansible)
3. Server Templating tools (Packer)
4. Orchestration tools (k8s)
5. IaC (Terraform)

# Part 2 : Terraform

## What is Terraform
A tool by hashicorp to build, change and versioning infrastructure safely and efficienty.

## Why Terraform
Take off all the learnings and best practices in development and apply them to infrastructure (versioning, reviews, documentation)

## Common patterns
Provisioning + Configuration management tools (Ansible)
Provisioning + Templating tools (Packer)
Provisioning + Orchestration tools (K8s)

## Architecture

## Setup 
1. Install Terraform : https://developer.hashicorp.com/terraform/install
2. Create AWS account
3. Install AWS cli : https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
4. Configure AWS cli

## Demo (part-2 folder)
1. Create a main.tf file 
2. terraform init
3. terraform plan
4. terraform apply
5. terraform destroy