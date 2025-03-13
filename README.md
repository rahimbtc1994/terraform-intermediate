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

# Part 3 : Terraform basics

## Terraform providers
Terraform has many providers (for different cloud platforms)

## Terraform init
- Download terraform provider
- Work directory :
  - .terraform
    - providers
      - registry.trraform.io
        - hashicorp
          - aws
            - os-arch
              - version
- Lock file : infos about installed dependencies

## Terraform plan/apply
- State file : 
  - tf reprenstation of the world (desired state), 
  - infos about deployed resources/data/objects
  - may contains sensitive data
  - can be stored locally or remotely

## Local backend
+ simple
- sensitive infos in plaintext
- uncollabortive
- manual

## Remote backend
+ sensitive inffos encryption
+ collaboration
+ automation
- complexity

## Terraform plan
1. compare the desired state with terraform/actual state
2. if something is found, it will notify ops and prepare actions to do to get to the desired state
3. then you  can do terraform apply

## Terraform destroy
To clean everything (in learning only)

## Remote backend : Terraform cloud / AWS S3
1. create a terraform cloud account
2. using aws s3 bucket + dynamodb for colab (chicken - egg problem)
   1. Bootstraping 1 : provision backend resources and then import them into our configuration
    - define the resources (s3 + dynamodb)
    - terraform init
    - terraform plan
    - terraform apply
   2. Bootstraping 2 : configure a remote backend with the desired infrastructure
    - Uncomment the remote backend configuration
    - terraform init
    - terraform apply

## Demo (part-3)
Web-App Generic web application architecture including:
- EC2 instances
- S3 bucket
- RDS instance
- Load balancer
- Route 53 DNS config

![Alt text](assets/architecture.png)

Steps :
1. Add the remote backend (aws s3)
2. Configure the region
3. Add the (EC2) instances 
4. Add a file storage (S3)
5. Add a VPC (if you don't want to configure a new vpc just refence the default)
6. Add a Subnet (if you don't want to configure a new Subnet just refence the default)
7. Define some security groups to allow inbound traffic using security group rules
8. Setup a loadbalancer listener
9. Define a loadbalancer target
10. Attach the EC2 instances to loadbalancer target
11. Setup a loadbalancer listener rule
12. Define some security groups for the loadbalancer using security group rules (ingress, egress)
13. Define the loadbalancer
14. Setup a Route53 to use an actual domain + a Route53 records
15. Create a db instance (RDS)

Take action:
- terraform init
- terraform plan
- terraform apply
- terraform destroy

# Part 4 : Variables & Outputs

## Variable types
1. Input variables, access : var.<name>
   ex : variable "instance_type" {
    description = "ec 2 insatance type"
    type        = string
    default     = "t2.micro"
   }

2. Local variables, access : local.<name>
   ex : locals {
    service = "My service"
    owner   = "DevOps btc"
   }

3. Output variables, why ? 
   ex : output "instance_ip_addr" {
    value = aws_instance.instance.public_ip
   }

## Setting Input vars
Lowest -> highest
- Manual entry during plan/apply
- Default value in declaration block
- TF_VAR_<name> env var
- terraform.tvars file
- *auto.tfvars file
- Command line -var or -var-file

## Types & validation
- string,number,bool 
- list(<attr name>),set(<attr name>),map(<attr name>),object({<attr name> = <type>, ... }), tuple([<attr name>])
- type : auto , custom conditions

## Sensitive data handling
1. Mark var as sensitive : Sensitive : true
2. Pass to terraform apply : TF_VAR_<name>, -var 
3. Use external secret store : AWS secrets manager

plan,apply will hide them

## Demo (part-4)
1. variables.tf
2. terraform.tfvars
3. another-terraform.tfvars : we to explicitly tell terraform when apply like : terraform apply -var-file=path/to/anoter/file
4. another way for sensitive data : terraform apply -var="db_user=myuser" ...

# Part 5 : Additional language features
To improve code even further

## See the Docs
1. conditions
2. loops
3. functions

## Meta-args
1. depends_on (define an order)
2. count (create multiple instances/copies)
3. foreach (create multiple copies + some control)
4. lifecycle (have some control on specific resources)
    - create_before_destroy : zero downtime deployment
    - ignore_changes : 
    - prevent_destroy : 

## Provisioners
Allows you to perform some actions locally/remotely 

# Part 6 : Modules
Organizing project to make the code reusable 

## Module 
Is a container for multiple resources that are used together,
A collections of .tf and/or .tf.json files in a directory
A main way to package and reuse resources

## Why
1. Instead of writing the same configuration multiple times, you can package it into a module and reuse it across different environments (e.g., dev, staging, production).
2. Modules hide complex infrastructure logic behind a simple interface, making it easier to work with large or complicated architectures.
3. Changes can be made in one module and propagated wherever it's used, simplifying updates and maintenance.
4. Modular code can handle growing infrastructure without becoming unmanageable.

## Types 
- Root module
- Child module

## Sources
- Locally
- Terrafom registry
- Github (https, ssh, generic)

## Input vars
You can pass them directly via module block

## Demo (part-6)

# Managing multiple envs

## Approaches
1. Workspaces : multiple tf files in our backend
  + easy
  + convient
  + minimize code
  - prone to humain errors
  - state in the same backend
2. File Structure : different sub-directories
  + ioslation of backend (security + less errors)
  + codebase represents the deployed state
  - code duplication
  - multiple tf apply required to provision env
  * Further separation useful for larger projects
  * isolate things that change frequently
  * Referencing resources ...

## Terragrunt (to see)