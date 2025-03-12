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