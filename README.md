
# README

## Technologies

* Terraform 0.12.*
* AWS

## Setup

**1. Environment Dependencies** -
Dependences to install in your machine before clone the project.

* [Terraform](https://www.terraform.io)

**2. Environment Variables** -
Create a file named `terraform.tfvars` on the root of the project with the following content and replace with your data

```text
environment             = ""
aws_region              = ""
aws_access_key          = ""
aws_secret_key          = ""
key_path                = ""
```

**3. Project init** -
To start the terraform project you have to use the init command

```bash
terraform init
```

**4. Project creation** -
To create the terraform project you have to use the plan and apply command, but now we are use only apply command.

```bash
terraform apply
```

It's will appear this massege:

```Text
Plan: 12 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
```

Answer **yes** to create the project, this will create the project at AWS, and will print in the console, the ec2 url:

```text
Outputs:

public_url = ec2-xxx-xxx-xxx-xxx.compute-x.amazonaws.com
```

**5. Destroy project** -
To delete the terraform project you have to use the destroy command

```bash
terraform destroy
```

It's will appear this massege:

```Text
Plan: 0 to add, 0 to change, 12 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value:
```

Answer **yes** to delete the project.
