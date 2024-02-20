# Basic GitOps Project

This covers the setup and management of a GitOps workflow utilizing a suite of powerful tools including Jenkins, Kubernetes (via minikube), Helm, and ArgoCD. Follow the steps below to get your GitOps pipeline up and running.

## Prerequisites

Ensure your system has the following software installed:

- Have a **[Dockerhub](https://hub.docker.com/)** account
- **[VirtualBox](https://www.virtualbox.org/)**: A free and open-source hosted hypervisor for x86 virtualization.
- **[Vagrant](https://www.vagrantup.com/)**: A tool for building and managing virtual machine environments.

## Setup Steps

### Step 1: Clone project

```bash
  git clone https://github.com/evandjefie/basic-gitops-project
  cd basic-gitops-project
```

### Step 2: Creating Virtual Machines

This project involves setting up two virtual machines (VMs):

- **vmjks**: Hosts Jenkins for automation, CI/CD.
- **vmk8s**: Hosts Kubernetes (using minikube), Helm, and ArgoCD for container orchestration and deployment.

#### Deployment

To deploy the VMs, execute the following commands:

```bash
cd Vagrant
vagrant up
```
Check the VMs' status with:
```bash
vagrant status
```

### Step 2: Configuring Jenkins Jobs

With the VMs running, the next step involves setting up Jenkins jobs for CI/CD.

Accessing Jenkins
Enter the Jenkins VM with:
```bash
vagrant ssh vmjks
```

*Default password: vagrant*

Job Setup
Configure two key Jenkins jobs:

- **ci-app**: Builds the app and pushes the Docker image to a registry.
- **cd-k8s**: Updates the image on the Kubernetes cluster automatically.

#### Configuration Details

- *Install Plugins and Secrets*: In Jenkins, install necessary plugins (e.g., Docker) and configure secrets for Docker Hub and GitHub access.
- *Prepare Jenkinsfiles*: Copy the Jenkinsfile from both ci-app and cd-k8s directories into their respective jobs on Jenkins. Adjust the Jenkinsfile contents to match your project specifics, such as repository URLs and Docker image names.


## Continuous Integration and Deployment

- **The ci-app job** should include steps for building your application, running tests, and pushing the built Docker image to a Docker registry.
- **The cd-k8s job** should pull the latest Docker image and deploy it to your Kubernetes cluster, making use of Helm for deployment and ArgoCD for managing the application lifecycle in a GitOps manner.

## 🔗 Follow me
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://evandjefie.site)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/evan-djefie)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/EvanDjefie)