# ==============================================
# ScaleWay Private Network
# ==============================================
# https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/data-sources/vpc_private_network
resource "scaleway_vpc_private_network" "private-network" {
    count = var.private_network ? 1 : 0
    name  = var.cluster_name
    tags  = var.tags
}

# ==============================================
# ScaleWay K8S Cluster
# ==============================================
# https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_cluster
resource "scaleway_k8s_cluster" "k8s-cluster" {
  # Specify the project ID
  project_id = var.project_id

  name                        = var.cluster_name
  type                        = var.cluster_type
  description                 = var.cluster_description
  version                     = var.k8s_version
  cni                         = var.k8s_cni
  tags                        = var.tags
  delete_additional_resources = var.delete_additional_resources
  private_network_id          = var.private_network ? scaleway_vpc_private_network.private-network[0].id : null

  autoscaler_config {
    disable_scale_down              = var.disable_scale_down
    scale_down_delay_after_add      = var.scale_down_delay_after_add
    estimator                       = var.estimator
    expander                        = var.expander
    ignore_daemonsets_utilization   = var.ignore_daemonsets_utilization
    balance_similar_node_groups     = var.balance_similar_node_groups
    expendable_pods_priority_cutoff = var.expendable_pods_priority_cutoff
  }
}

# ==============================================
# ScaleWay K8S Pool
# ==============================================
# https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_pool
resource "scaleway_k8s_pool" "k8s-cluster-pool" {
  cluster_id = scaleway_k8s_cluster.k8s-cluster.id

  for_each               = { for pool in var.k8s_pools : pool.k8s_pool_name => pool }
  zone                   = each.value.zone != null ? each.value.zone : null
  name                   = each.value.k8s_pool_name
  node_type              = each.value.k8s_pool_type
  container_runtime      = each.value.container_runtime
  size                   = each.value.k8s_pool_size
  autoscaling            = each.value.k8s_pool_autoscaling
  autohealing            = each.value.k8s_pool_autohealing
  min_size               = each.value.k8s_pool_min_size
  max_size               = each.value.k8s_pool_max_size
  root_volume_type       = each.value.root_volume_type
  root_volume_size_in_gb = each.value.root_volume_size_in_gb
  upgrade_policy {
    max_surge = each.value.upgrade_policy[0].max_surge
    max_unavailable =  each.value.upgrade_policy[0].max_unavailable
  }
}
