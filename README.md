# Django on AWS ECS with Terraform & GitHub Actions 🚀

This project automates the deployment of a **Django application** on **AWS ECS (Fargate)** with **RDS (PostgreSQL)** using **Terraform and GitHub Actions**.

## 🚀 Deployment Overview
- **Infrastructure**: Terraform provisions AWS ECS, RDS, ALB, and networking.
- **Application**: Django is containerized and deployed to AWS ECS (Fargate).
- **CI/CD**: GitHub Actions automates the entire deployment.

---

## 🔹 Prerequisites
1. **AWS Account** with IAM permissions.
2. **GitHub Repository** for CI/CD.
3. **Terraform Installed** (`terraform init` is run via GitHub Actions).
4. **GitHub Secrets** configured:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `DB_PASSWORD`

---

## 🔹 How It Works
1. **Push code to `main` branch** → GitHub Actions triggers CI/CD.
2. **GitHub Actions runs Terraform** to provision AWS infrastructure.
3. **Docker image is built & pushed** to AWS ECR.
4. **ECS Service is updated** with the new image.
5. **Django app is accessible via ALB**.

---

## 🔹 Usage
### **Trigger Deployment**
Simply **push your code** to the `main` branch:
```sh
git add .
git commit -m "Deploy new version"
git push origin main
