# vSphere Connection Details
vsphere_server = "vsphere.example.com"
vsphere_user = "admin@vsphere.local"
vsphere_password = "your-password"

# VM Deployment Configuration
vm_count = 4
vm_name_prefix = "win-server"
vm_template = "windows-server-2019-template"
vm_cpu = 2
vm_ram = 4096
vm_disk_size = 100
vm_datastore = "datastore1"
vm_domain = "example.com"
vm_dns_name_prefix = "winserv"
vm_ip_prefix = "10.0.0."
vm_network = "VM Network"
vm_vlan = "100"
vm_dmz = false
vm_encryption = true
vm_cluster = "Cluster1"
vm_host = "esxi1.example.com"

# Optional: OS-specific configurations
# Uncomment and modify as needed for your environment

# For Windows VMs
# vm_template = "windows-server-2019-template"
# vm_cpu = 4
# vm_ram = 8192
# vm_disk_size = 120

# For Ubuntu VMs
# vm_template = "ubuntu-20.04-template"
# vm_cpu = 2
# vm_ram = 4096
# vm_disk_size = 50

# For CentOS VMs
# vm_template = "centos-8-template"
# vm_cpu = 2
# vm_ram = 4096
# vm_disk_size = 60

# For Oracle Linux VMs
# vm_template = "oracle-linux-8-template"
# vm_cpu = 4
# vm_ram = 8192
# vm_disk_size = 100