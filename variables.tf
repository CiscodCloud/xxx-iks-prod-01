variable "api_key" {
  type = string
  description = "API Key Id from Intersight"
}
variable "secretkey" {
  type = string
  description = "The path to your secretkey for Intersight OR the your secret key as a string"
}

variable "endpoint" {
  type = string
  description = "endpoint Name"
  default = "default"
}

variable "organization" {
  type = string
  description = "Organization Name"
  default = "default"
}

variable "ssh_key" {
  type = string
  description = "The ssh_key for the IKS cluster"
}

variable "vc_password" {
  type = string
  description = "Password of the account to be used with vCenter. This should be the password for the account used to register vCenter with Intersight."
}

variable "cluster_name" {
  type = string
  description = "IKS Cluster Name"
}

variable "vc_target_name" {
  type = string
  description = "Target vCenter"
}


variable "vc_cluster" {
  type = string
  description = "VMware Cluster"
}

variable "datastore" {
  type = string
  description = "VMware Datastore"
}
