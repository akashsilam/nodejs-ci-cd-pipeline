# CI/CD Pipeline for Node.js Application on AWS

## Overview
This project demonstrates a Continuous Integration and Continuous Deployment (CI/CD) pipeline for a simple Node.js application, using **GitHub Actions** and **AWS services**. The pipeline automates the process of:

1. Running tests automatically on every pull request to the `main` branch.
2. Building a Docker image and pushing it to **AWS Elastic Container Registry (ECR)**.
3. Deploying the Docker image to **AWS Elastic Container Service (ECS)**.
4. Sending notifications about the deployment success or failure.

## Approach

### 1. **Test Automation**
- The pipeline runs automated tests every time a pull request is created or updated for the `main` branch.
- We are using **Jest** for running tests. The tests are executed with the `npm test` command.

### 2. **Docker Image Build and Deployment**
- **Docker** is used to containerize the Node.js application.
- The pipeline builds a Docker image for the Node.js app and pushes it to **AWS Elastic Container Registry (ECR)**.
- The image is then deployed to **AWS Elastic Container Service (ECS)** for serving the application.

### 3. **Notifications**
- After each deployment, the pipeline sends notifications based on the deployment result (success or failure). You can modify the notification method to suit your needs (e.g., using email or Slack).

## Files in the Repository
- **`.github/workflows/ci-cd-pipeline.yml`**: GitHub Actions workflow configuration that automates the CI/CD pipeline.
- **`Dockerfile`**: Docker configuration to build the image for the Node.js app.
- **`app.js`**: The main Node.js application code.
- **`test/app.test.js`**: Unit tests for the Node.js application using **Jest**.
- **`docker-compose.yml`**: Optional file used with ECS for deployment.
- **`README.md`**: Documentation explaining how to use the repository.

## Prerequisites
Before you can run this pipeline, you'll need to:

1. Set up an **AWS Elastic Container Registry (ECR)** repository to store the Docker images.
2. Set up an **AWS Elastic Container Service (ECS)** cluster to deploy the application.
3. Create IAM roles and AWS credentials (stored in GitHub secrets) to allow the pipeline to interact with AWS services.

## How to Use
1. Fork or clone this repository to your local machine.
2. Make your changes to the Node.js application code or Docker configuration.
3. Commit and push your changes to GitHub.
4. The **GitHub Actions** pipeline will automatically trigger the tests, build the Docker image, push it to ECR, and deploy it to ECS.
5. You will receive a notification about the deployment status.

## How to Run Locally
To run the application locally, follow these steps:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/<your-username>/nodejs-ci-cd-pipeline.git
   cd nodejs-ci-cd-pipeline
