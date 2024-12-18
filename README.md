# CI/CD Pipeline for Node.js Application

## Overview
This repository contains a Node.js application with a CI/CD pipeline using GitHub Actions. The pipeline automates the process of:

1. Running tests on pull requests.
2. Building a Docker image and pushing it to Docker Hub.
3. Deploying the image to a Kubernetes cluster.
4. Sending notifications on deployment success or failure.

## Approach

### 1. **Test Automation**
The pipeline runs tests on every pull request to the `main` branch. The tests are executed using the command `npm test`. This ensures that only code that passes tests is merged.

### 2. **Docker Image Build and Deployment**
The pipeline builds a Docker image using a `Dockerfile` in the repository. It then pushes the built image to Docker Hub. The Kubernetes deployment is updated with the newly pushed Docker image.

Steps in the pipeline:
- Build Docker image: `docker build -t <username>/nodejs-app:<commit_hash> .`
- Push Docker image: `docker push <username>/nodejs-app:<commit_hash>`
- Deploy the new image to Kubernetes using `kubectl`:
  - `kubectl set image deployment/nodejs-deployment nodejs-app=<username>/nodejs-app:<commit_hash>`
  - `kubectl rollout status deployment/nodejs-deployment`

### 3. **Notifications**
Notifications are sent to an email address to inform about the success or failure of the deployment. This is done using the `mail` command or can be extended to integrate with other services like Slack, Teams, or email APIs.

## Files in the Repository
- `.github/workflows/ci-cd-pipeline.yml`: GitHub Actions workflow file.
- `Dockerfile`: Docker configuration for building the Node.js app image.
- `app.js`: The Node.js application (you can add your actual application code here).
- `k8s/deployment.yaml`: Kubernetes deployment configuration (if applicable).
- `README.md`: Documentation explaining the project setup.

## How to Use
1. Fork the repository or clone it to your local machine.
2. Make changes to the code or workflow as needed.
3. Submit a pull request for review.
4. The pipeline will automatically run tests on pull requests and deploy the changes on successful merges to `main`.

## Prerequisites
- Docker account with credentials stored in GitHub Secrets (`DOCKER_USERNAME`, `DOCKER_PASSWORD`).
- Kubernetes cluster and `kubectl` configuration stored in GitHub Secrets (`KUBECONFIG`).
- GitHub Actions enabled for the repository.

## Conclusion
This CI/CD pipeline automates the process of testing, building, and deploying a Node.js application, ensuring that changes are properly tested and deployed with minimal manual intervention.

