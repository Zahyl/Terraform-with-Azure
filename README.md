## Terraform-Based Azure Infrastructure Automation for Cloud Deployment

### Overview

This project demonstrates my proficiency in automating the deployment of cloud infrastructure on Microsoft Azure using Terraform. Leveraging Terraform's power and flexibility, I've created a comprehensive and highly efficient infrastructure setup that ensures seamless cloud deployment.

### Key Features

- **Resource Group:** A logically grouped collection of resources, providing easy management and organization of Azure resources.

- **Virtual Network:** The foundation of the cloud network, facilitating secure communication between resources within the same network.

- **Subnet:** Partitioning of the virtual network into smaller, manageable sub-networks to control traffic flow and enhance security.

- **Log Analytics Workspace:** Centralized monitoring and analysis of system data for insights and diagnostics.

- **Recovery Services Vault:** Disaster recovery and backup solution for business continuity.

- **Storage Account:** Scalable and secure cloud storage for various types of data.

- **CentOS Linux VMs:** Virtual Machines running CentOS Linux operating system for versatile application hosting.

- **Windows Server VM:** Virtual Machines running Windows Server OS for Microsoft-based application deployment.

- **Data Disks:** Additional storage attached to VMs for data persistence and separation.

- **Basic Load Balancer:** Distributes incoming traffic across VM instances to ensure high availability.

- **Azure DB for PostgreSQL Instance:** Managed PostgreSQL database service on Azure for reliable data storage and retrieval.

### Terraform Configuration

The entire Azure infrastructure is represented and defined in Terraform configuration files. With parametrized configurations and logical naming conventions, the setup is flexible, easily customizable, and maintainable. The Azure backend is utilized for storing Terraform state information, ensuring accuracy and reliability during infrastructure updates.

### How to Use

To deploy this Azure infrastructure setup using Terraform, follow these steps:

1. Make sure you have Terraform installed on your local machine.
2. Clone this repository to your preferred location.
3. Navigate to the repository directory.
4. Customize the `terraform.tfvars` file with your desired variable values.
5. Run `terraform init` to initialize the working directory.
6. Run `terraform plan` to preview the infrastructure changes.
7. Run `terraform apply` to apply the configuration and create the Azure infrastructure.
8. Confirm the changes and wait for the deployment to complete.

