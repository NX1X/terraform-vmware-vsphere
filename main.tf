# main.tf

variable "vsphere_server" {}
variable "vsphere_user" {}
variable "vsphere_password" {}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 1
}

variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
}

variable "vm_template" {}
variable "vm_cpu" {}
variable "vm_ram" {}
variable "vm_disk_size" {}
variable "vm_datastore" {}
variable "vm_domain" {}
variable "vm_dns_name_prefix" {}
variable "vm_ip_prefix" {}
variable "vm_network" {}
variable "vm_vlan" {}
variable "vm_dmz" {}
variable "vm_encryption" {}
variable "vm_cluster" {}
variable "vm_host" {}

terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 2.2.0"
    }
  }
}

provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "your-datacenter-name"
}

data "vsphere_datastore" "datastore" {
  name          = var.vm_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vm_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vm_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  count            = var.vm_count
  name             = "${var.vm_name_prefix}-${count.index + 1}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  host_system_id   = var.vm_host

  num_cpus = var.vm_cpu
  memory   = var.vm_ram
  guest_id = data.vsphere_virtual_machine.template.guest_id

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label            = "disk0"
    size             = var.vm_disk_size
    thin_provisioned = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "${var.vm_dns_name_prefix}-${count.index + 1}"
        domain    = var.vm_domain
      }

      network_interface {
        ipv4_address = "${var.vm_ip_prefix}${count.index + 10}"
        ipv4_netmask = 24
      }

      ipv4_gateway = "${var.vm_ip_prefix}1"
    }
  }

  enable_disk_uuid = var.vm_encryption

  tags = [
    vsphere_tag.dmz.id,
    vsphere_tag.vlan.id
  ]
}

resource "vsphere_tag_category" "category" {
  name        = "vm-properties"
  cardinality = "MULTIPLE"
  description = "Managed by Terraform"

  associable_types = [
    "VirtualMachine",
  ]
}

resource "vsphere_tag" "dmz" {
  name        = var.vm_dmz ? "dmz" : "non-dmz"
  category_id = vsphere_tag_category.category.id
  description = "Managed by Terraform"
}

resource "vsphere_tag" "vlan" {
  name        = "vlan-${var.vm_vlan}"
  category_id = vsphere_tag_category.category.id
  description = "Managed by Terraform"
}