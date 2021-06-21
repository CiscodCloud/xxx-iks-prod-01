provider "intersight" {
  apikey    = var.apikey
  secretkey = var.secretkey
  endpoint = "https://intersight.com"
}


terraform {
  required_providers {
    intersight = {
      source = "ciscodevnet/intersight"
      version = "1.0.10"
    }
  }
}
#module "terraform-intersight-iks" {
#  source = "terraform-cisco-modules/iks/intersight//modules/terraform-intersight-iks/"
  # source = "terraform-cisco-modules/iks/intersight//"
  # Infra Config Policy Information


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
  ntp_servers         = ["198.19.255.137"]
  dns_servers         = ["198.19.254.82"]

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
  # Network Configuration Settings
  # pod_cidr = "100.65.0.0/16"
  # service_cidr = "100.64.0.0/24"
  # cni = "Calico"
  domain_name = "dcv.svpod"
  timezone    = "Etc/UTC"


  # Trusted Registry Entry
  # unsigned_registries = ["10.101.128.128"]
  # root_ca_registries  = [""]

  # Cluster information
  ssh_user       = var.ssh_user
  ssh_key        = var.ssh_key
  worker_size    = "medium"
  worker_count   = 3
  master_count   = 1
  load_balancers = 2
  # Organization and Tag
  organization = var.organization
  #tags         = var.tags
}
