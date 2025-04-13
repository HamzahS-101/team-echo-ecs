# team-echo-ecs

## CI/CD Deployment Workflow

The deployment process of the **Team Echo App** is automated using **GitHub Actions**:

---

### Docker Image Build, Trivy Scan & Push (`docker-image.yml`)

- Builds the Docker image  
- Runs **Trivy** to scan for critical and high vulnerabilities  
- Pushes the image to **Amazon ECR**

---

### Terraform Plan (`tf-plan.yml`)

- Downloads the `.tfvars` file from an **S3 bucket**
- Verifies the `.tfvars` file is available in the `terraform/` folder
- Sets up **Terraform**
- Installs and runs **TFLint** to check Terraform syntax and best practices
- Runs **Checkov** to detect security misconfigurations in Terraform files
- Performs **Terraform Format Check** and **Validate** to ensure consistent formatting and correct logic

---

### Terraform Apply (`tf-apply.yml`)

- Runs **only if** the Terraform Plan completes successfully
- Sets up and initializes Terraform
- Applies the Terraform plan

---

### Terraform Destroy (`tf-destroy.yml`)

- Destroys all Terraform resources on workflow dispatch
