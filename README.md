# Terraform template for bootstrapping GCP projects. 
It should currently provision:

- A custom VPC network and environment subnetworks
- Kubernetes-oriented secondary IP ranges
- Firewall rules for internal traffic and IAP SSH
- A service account for compute/Kubernetes nodes
- IAM permissions for logging and monitoring
- Compute Engine instances for development nodes

## Requirements

- Terraform
- Google Cloud SDK
- A Google Cloud project
- Appropriate GCP permissions
- Authenticated Google Cloud credentials

Authenticate locally:

```bash
gcloud auth application-default login