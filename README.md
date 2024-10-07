# vSphere VM Terraform Module

Disclaimer: This module was developed to serve my workplace. The repository is a template without credentials and is still under development.

This Terraform module allows you to deploy multiple virtual machines on VMware vSphere with the same configuration. It supports various operating systems and provides flexibility in configuring VM attributes.

## Supported Operating Systems

- Windows Server
- Ubuntu
- CentOS
- Oracle Linux

## VM Attributes

The module allows you to specify the following VM attributes:

- Number of VMs to create
- CPU
- RAM
- Hard disk size
- Storage (datastore)
- Active Directory domain
- DNS name prefix
- IP address prefix
- Network adapter
- VLAN
- DMZ flag
- Encryption
- Cluster
- Host

## Prerequisites

1. Terraform installed (version 0.14.0 or later)
2. Access to a vSphere environment
3. vSphere templates for the operating systems you want to deploy

## Usage

1. Clone this repository:

   ```
   git clone https://github.com/your-username/vsphere-vm-module.git
   cd vsphere-vm-module
   ```

2. Create a `terraform.tfvars` file in the root of the project directory and fill in your vSphere and VM details:

   ```hcl
   vsphere_server = "vsphere.example.com"
   vsphere_user = "admin@vsphere.local"
   vsphere_password = "your-password"

   vm_count = 4
   vm_name_prefix = "test-vm"
   vm_template = "ubuntu-20.04-template"
   vm_cpu = 2
   vm_ram = 4096
   vm_disk_size = 50
   vm_datastore = "datastore1"
   vm_domain = "example.com"
   vm_dns_name_prefix = "test-vm"
   vm_ip_prefix = "10.0.0."
   vm_network = "VM Network"
   vm_vlan = "100"
   vm_dmz = false
   vm_encryption = true
   vm_cluster = "Cluster1"
   vm_host = "esxi1.example.com"
   ```

3. Initialize the Terraform working directory:

   ```
   terraform init
   ```

4. Review the Terraform plan:

   ```
   terraform plan
   ```

5. Apply the Terraform configuration:

   ```
   terraform apply
   ```

## Module Structure

- `main.tf`: Contains the main Terraform configuration for the vSphere VM module.
- `variables.tf`: Defines all the input variables for the module.
- `outputs.tf`: Defines the outputs that the module will produce.

## Customization

To deploy different operating systems, create separate templates in vSphere for each OS (Windows Server, Ubuntu, CentOS, Oracle Linux). Then, specify the appropriate template name in the `vm_template` variable when deploying VMs.

The module will create VMs with names and IP addresses incremented based on the count. For example, if `vm_name_prefix` is "test-vm" and `vm_ip_prefix` is "10.0.0.", it will create:

- test-vm-1 with IP 10.0.0.10
- test-vm-2 with IP 10.0.0.11
- test-vm-3 with IP 10.0.0.12
- test-vm-4 with IP 10.0.0.13

Adjust the `vm_count` variable to create more or fewer VMs as needed.

## Contributing

Contributions to improve the module are welcome. Please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature-name`)
3. Make your changes
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin feature/your-feature-name`)
6. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you encounter any issues or have questions, please file an issue on the GitHub repository.