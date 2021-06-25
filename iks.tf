module "iks" {
  source              = "terraform-cisco-modules/iks/intersight"
  version             = "1.0.11"

  # Infra Config Policy Information
  cluster_name        = var.cluster_name
  cluster_action      = "Deploy"
  vc_target_name      = var.vc_target_name
  vc_password         = var.vc_password
  vc_datastore        = var.datastore
  vc_cluster          = var.vc_cluster
  vc_resource_pool    = var.vc_resource_pool
  vc_portgroup        = ["sandpit|IST|demo"]

  # IP Pool Information
  ip_starting_address = "100.64.2.150"
  ip_pool_size        = "20"
  ip_netmask          = "255.255.255.0"
  ip_gateway          = "100.64.2.1"
<<<<<<< HEAD
  ip_primary_dns      = "198.19.254.82"
  ip_secondary_dns    = "198.19.255.137"

=======
  ntp_servers         = ["198.19.255.137"]
  dns_servers         = ["198.19.254.82,198.19.255.137"]
  
  
>>>>>>> parent of a22813c... Update iks.tf
  # Network Configuration Settings
  domain_name         = "dcv.svpod"
  timezone            = "Etc/GMT"

  # Network Configuration Settings
  pod_cidr = "100.64.3.0/24"
  service_cidr = "100.64.4.0/24"

  # Cluster information
  ssh_user            = "iksadmin"
  ssh_key             = var.ssh_key
  worker_size         = "small"
  worker_count        = 3
  master_count        = 1
  # Organization
  organization        = var.organization
}
