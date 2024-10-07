output "vm_names" {
  description = "The names of the created VMs"
  value       = vsphere_virtual_machine.vm[*].name
}

output "vm_ips" {
  description = "The IP addresses of the created VMs"
  value       = vsphere_virtual_machine.vm[*].guest_ip_addresses
}

output "vm_uuids" {
  description = "The UUIDs of the created VMs"
  value       = vsphere_virtual_machine.vm[*].uuid
}