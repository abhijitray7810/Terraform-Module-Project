# Terraform AWS VPC Module (Own Module – Stage 1)

This project demonstrates how to build and consume a **custom Terraform VPC module** following **real DevOps best practices**.

It supports:

* User-defined VPC CIDR
* Multiple subnets
* Public & private subnets
* Conditional Internet Gateway creation
* Automatic route table association for public subnets

This structure is **interview-ready**, **production-aligned**, and **scalable for future stages**.

---

## 📌 Architecture Overview

* One VPC
* Multiple subnets across Availability Zones
* Public subnets:

  * Auto-assign public IP
  * Internet Gateway attached
  * Public route table association
* Private subnets:

  * No public IP
  * No direct internet access

---

## 📁 Project Structure

```
own_modules_vpc_2/
├── root-main.tf
├── terraform.tfstate   (generated)
├── terraform.tfstate.backup
└── modules/
    └── vpc/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        ├── versions.tf
        └── README.md
```

---

## ⚙️ Requirements

| Tool         | Version  |
| ------------ | -------- |
| Terraform    | >= 1.5.0 |
| AWS Provider | >= 5.0   |
| AWS Account  | Required |

AWS credentials must be configured using **any one** of the following:

* AWS CLI (`aws configure`)
* Environment variables
* IAM Role (recommended for EC2)

---

## 🚀 How to Use This Project

### 1️⃣ Clone or Download the Repository

```bash
git clone <your-repo-url>
cd own_modules_vpc_2
```

---

### 2️⃣ Configure AWS Provider (Root Module)

`root-main.tf`

```hcl
provider "aws" {
  region = "us-east-1"
}
```

> ⚠️ Provider configuration must always be in the **root module**, never inside a Terraform module.

---

### 3️⃣ Define Infrastructure Using the VPC Module

```hcl
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "10.0.0.0/16"
  vpc_name = "my-vpc"

  subnets = {
    public-subnet-1 = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1a"
      public     = true
    }

    private-subnet-1 = {
      cidr_block = "10.0.2.0/24"
      az         = "us-east-1b"
    }
  }
}
```

---

### 4️⃣ Initialize Terraform

```bash
terraform init
```

---

### 5️⃣ Validate & Plan

```bash
terraform validate
terraform plan
```

---

### 6️⃣ Apply Infrastructure

```bash
terraform apply
```

Type `yes` when prompted.

---

## 📥 Input Variables

### `vpc_cidr`

* Description: CIDR block for the VPC
* Type: `string`
* Example: `10.0.0.0/16`

### `vpc_name`

* Description: Name tag for the VPC
* Type: `string`

### `subnets`

* Description: Map of subnet configurations
* Type:

```hcl
map(object({
  cidr_block = string
  az         = string
  public     = optional(bool, false)
}))
```

---

## 📤 Outputs

| Output Name  | Description                       |
| ------------ | --------------------------------- |
| `vpc_id`     | ID of the created VPC             |
| `subnet_ids` | Map of subnet names to subnet IDs |

---

## 🧠 Important Terraform Best Practices

* ✅ Always run Terraform from the **root directory**
* ❌ Never run `terraform plan` inside a module
* ✅ Keep provider configuration only in root module
* ✅ Use modules for reusable infrastructure logic
* ✅ Avoid interactive variable inputs for modules

---

## 🛠 Common Errors & Fixes

### Error: `Invalid provider configuration`

✔ Fix: Add AWS provider block in root module

### Error: `map of object required`

✔ Fix: Pass subnet configuration as a map, not a number

### Error: `invalid AWS region`

✔ Fix: Specify region in provider block

---

## 🔮 Future Enhancements (Next Stages)

* NAT Gateway for private subnets
* VPC Endpoints (S3, DynamoDB)
* Auto Scaling Group + ALB
* IAM Roles for EC2
* Multi-environment (dev/prod)

---

## 📚 Learning Outcome

By completing this project, you learn:

* Terraform module design
* Conditional resource creation
* `for_each` and `map(object)` usage
* Real-world AWS VPC architecture
* DevOps industry best practices

---

## 👤 Author

**Abhijit Ray**
Aspiring DevOps & Cloud Engineer
Skills: AWS | Terraform | Docker | Kubernetes | Linux | CI/CD

---

⭐ If this project helped you, consider starring the repository and sharing it on LinkedIn.
