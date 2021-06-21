module "iks" {
  source              = "terraform-cisco-modules/iks/intersight"
  version             = "0.9.20"

  cluster_name = var.cluster_name
  # cluster_action   = "Deploy"
  vc_target_name   =  var.vc_target_name
  vc_portgroup     = var.portgroup
  vc_datastore     = var.datastore
  vc_cluster       = var.vc_cluster
  vc_resource_pool = var.vc_resource_pool
  vc_password      = var.vc_password


  # IP Pool Information
  ip_starting_address = "10.139.120.220"
  ip_pool_size        = "20"
  ip_netmask          = "255.255.255.0"
  ip_gateway          = "10.139.120.1"
  ip_primary_dns      = "198.19.255.137
  ip_secondary_dns    = "198.19.254.82"

  # Network Configuration Settings
  domain_name = "dcv.svpod"
  timezone    = "Etc/UTC"


  # Cluster information
  ssh_user       = var.ssh_user
  ssh_key        = var.ssh_key
  worker_size         = "medium"
  worker_count        = 3
  master_count        = 1
  # Organization
  organization        = var.organization
}
