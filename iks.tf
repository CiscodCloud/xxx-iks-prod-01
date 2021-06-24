module "iks" {
  source              = "terraform-cisco-modules/iks/intersight"
  version             = "1.0.0"

  # Infra Config Policy Information
  cluster_name        = var.cluster_name
  cluster_action      = "undeploy"
  vc_target_name      = var.vc_target_name
  vc_password         = var.vc_password
  vc_datastore        = var.datastore
  vc_cluster          = var.vc_cluster
  vc_resource_pool    = var.vc_resource_pool
  vc_portgroup        = ["sandpit|ist|demo"]
  #vc_portgroup        = ["production|iks|nodes"]

  # IP Pool Information
  ip_starting_address = "100.64.2.150"
  ip_pool_size        = "20"
  ip_netmask          = "255.255.255.0"
  ip_gateway          = "100.64.2.1"
  ntp_servers         = ["198.19.255.137"]
  dns_servers         = ["198.19.254.82"]
  
  
  # Network Configuration Settings
  domain_name         = "dcv.svpod"
  timezone            = "Etc/GMT"
  
  # Network Configuration Settings
  pod_cidr = "100.64.8.0/22"
  service_cidr = "100.64.12.0/22"

  # Cluster information
  ssh_user            = "iksadmin"
  ssh_key             = var.ssh_key
  worker_size         = "medium"
  worker_count        = 5
  master_count        = 1
  # Organization
  organization        = var.organization
  
  
  addons_list = [{
    addon_policy_name = "dashboard"
    addon             = "kubernetes-dashboard"
    description       = "K8s Dashboard Policy"
    upgrade_strategy  = "AlwaysReinstall"
    install_strategy  = "InstallOnly"
    },
    {
      addon_policy_name = "monitor"
      addon             = "ccp-monitor"
      description       = "Grafana Policy"
      upgrade_strategy  = "AlwaysReinstall"
      install_strategy  = "InstallOnly"
    }
  ]
}

  
