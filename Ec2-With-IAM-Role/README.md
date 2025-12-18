# EC2 with IAM Role (No Access Keys)

This project demonstrates how to launch an **AWS EC2 instance with an IAM Role** instead of using hardcoded AWS access keys. The EC2 instance gets **read-only access to Amazon S3** using an IAM Role and Instance Profile.

This is a **best-practice DevOps setup** and commonly asked in interviews.

---

## 🚀 Project Objectives

✔ Create a custom VPC
✔ Create a public subnet with Internet access
✔ Launch an EC2 instance in the public subnet
✔ Create an IAM Role with **AmazonS3ReadOnlyAccess**
✔ Attach IAM Role to EC2 using Instance Profile
✔ **No AWS access keys used anywhere**
✔ Output EC2 public IP

---

## 📁 Project Structure

```
ec2-with-iam-role/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── iam/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── ec2/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## 🛠️ Technologies Used

* **Terraform** (Infrastructure as Code)
* **AWS EC2**
* **AWS VPC**
* **AWS IAM (Role & Instance Profile)**
* **Amazon S3 (ReadOnly Access)**

---

## 🔐 Why No Access Keys?

Using IAM Roles is more secure than storing AWS access keys:

* No hardcoded credentials
* Automatic credential rotation
* Least privilege access
* Works seamlessly with AWS services

This project follows **AWS security best practices**.

---

## 📦 IAM Role Details

* Role Name: `ec2-s3-readonly-role`
* Policy Attached: `AmazonS3ReadOnlyAccess`
* Trusted Entity: `ec2.amazonaws.com`

The role is attached to the EC2 instance using an **IAM Instance Profile**.

---

## ▶️ How to Run the Project

### 1️⃣ Clone the Repository

```bash
git clone <your-github-repo-url>
cd ec2-with-iam-role
```

### 2️⃣ Initialize Terraform

```bash
terraform init
```

### 3️⃣ Review the Plan

```bash
terraform plan
```

### 4️⃣ Apply the Configuration

```bash
terraform apply
```

Type `yes` when prompted.

---

## 📤 Outputs

After successful deployment, Terraform will output:

```bash
ec2_public_ip = <EC2_PUBLIC_IP>
```

---

## 🧪 Testing IAM Role Access (Optional)

If you access the EC2 instance (via SSM or SSH if enabled), run:

```bash
aws s3 ls
```

✅ This command works **without configuring AWS access keys**.

---

## 🧠 Interview & Learning Takeaways

* Difference between **IAM Role vs IAM User**
* How EC2 assumes IAM Role using **STS**
* Why IAM Roles are preferred over access keys
* Real-world DevOps security practices

---

## ⚠️ Cleanup

To avoid AWS charges, destroy resources after use:

```bash
terraform destroy
```

---

## 📌 Future Improvements

* Add **SSM Session Manager** access (remove SSH completely)
* Add **user_data** to auto-test S3 access
* Add **IMDSv2 enforcement**
* Convert to reusable Terraform module

---

## 👨‍💻 Author

**Abhijit Ray**
B.Tech CSE | DevOps & Cloud Enthusiast

🔗 LinkedIn: *Add your LinkedIn profile*
🔗 GitHub: *Add your GitHub repo link*

---

⭐ If you find this project useful, give it a star on GitHub!
