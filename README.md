🧠 Ollama Deployment
A minimal GitHub Actions-powered deployment setup for installing Ollama and downloading the Phi model on an EC2 instance.

🚀 What This Does
This repository provides a one-click deployment of an Ollama server on a remote EC2 instance.
When you push to the main branch or trigger the workflow manually:

✅ GitHub Actions will:

-SSH into your EC2 instance (t3.large or bigger is recommended)
-Install Ollama
-Download the phi model
-Make the instance ready to serve AI requests

⚙️ Prerequisites
Before using the workflow, ensure the following:

1. Provision an EC2 Instance
-Use an instance with at least t3.large (for better performance).
-Make sure port 11434 is open in the EC2's Security Group (for Ollama API access)
-Enable SSH access from GitHub Actions (port 22).

2. Add GitHub Secrets
In your repository settings, go to Settings > Secrets > Actions, and add:

Secret Name	            Description
SSH_PRIVATE_KEY	       The private SSH key for your EC2 access
EC2_HOST	             Public IP address of the EC2 instance
EC2_USERNAME	         Username (e.g., ubuntu)

🛠️ Deployment Instructions
✅ Automatic Deploy (Recommended)
Fork or clone the repository and create your changes in a new branch:
    git checkout -b my-deploy-branch

Commit and push your changes:
    git push origin my-deploy-branch
    Open a Pull Request into the main branch from your branch.

After the PR is merged into main, GitHub Actions will automatically run the deployment workflow.

🚀 Or trigger it manually:
    -Go to GitHub → Actions → Ollama Deploy → Run workflow
    -Click “Run workflow”

