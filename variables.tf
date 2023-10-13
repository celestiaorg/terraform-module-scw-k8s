# ==============================================
# ScaleWay Provider
# ==============================================
variable "zone" {
  type        = string
  description = "Cluster's zone: [fr-par-1 fr-par-2 fr-par-3 nl-ams-1 nl-ams-2 pl-waw-1 pl-waw-2]"
  default     = "nl-ams-1"
}
variable "region" {
  type        = string
  description = "Cluster's region: fr-par, nl-ams, pl-waw"
  default     = "nl-ams"
}
variable "project_id" {
  type        = string
  description = "Project ID, you can find them here: https://console.scaleway.com/project/settings"
  default     = "YOU-NEED-TO-SPECIFY-IT"
}

# ==============================================
# Kubernetes Cluster
# ==============================================
variable "cluster_name" {
  type        = string
  description = "The name for the Kubernetes cluster."
  default     = "k8s-cluster-name"
}
variable "cluster_type" {
  type        = string
  description = "The type of the Kubernetes cluster. (https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_cluster#type)"
  default     = "kapsule"
}
variable "cluster_description" {
  type        = string
  description = "A description for the Kubernetes cluster."
  default     = "Cluster Description"
}
variable "k8s_version" {
  type        = string
  description = "K8S Version"
  default     = "1.26.0"
}
variable "k8s_cni" {
  type        = string
  description = "CNI"
  default     = "cilium"
}
variable "tags" {
  type        = list(any)
  description = "Tag list"
  default     = ["dev"]
}
variable "delete_additional_resources" {
  type        = bool
  description = "Delete additional resources like block volumes, IPs and loadbalancers that were created in Kubernetes on cluster deletion"
  default     = false
}

# ==============================================
# Kubernetes AutoScaler Config
# ==============================================
variable "disable_scale_down" {
  type        = bool
  description = "Disables the scale down feature of the autoscaler."
  default     = false
}
variable "scale_down_delay_after_add" {
  type        = string
  description = "How long after scale up that scale down evaluation resumes."
  default     = "5m"
}
variable "estimator" {
  type        = string
  description = "Type of resource estimator to be used in scale up."
  default     = "binpacking"
}
variable "expander" {
  type        = string
  description = "Type of node group expander to be used in scale up."
  default     = "random"
}
variable "ignore_daemonsets_utilization" {
  type        = bool
  description = "Ignore DaemonSet pods when calculating resource utilization for scaling down."
  default     = true
}
variable "balance_similar_node_groups" {
  type        = bool
  description = "Detect similar node groups and balance the number of nodes between them."
  default     = true
}
variable "expendable_pods_priority_cutoff" {
  type        = string
  description = "Pods with priority below cutoff will be expendable."
  default     = "-5"
}

# ==============================================
# Kubernetes Pool Config
# ==============================================
variable "k8s_pools" {
  type = list(object({
    zone                 = optional(string), # Zone
    k8s_pool_name        = string, # Pool name
    k8s_pool_type        = string, # Type of the node
    k8s_pool_size        = number, # This field will only be used at creation if autoscaling is enabled.
    container_runtime    = string, # Container runtime
    k8s_pool_autoscaling = bool,   # Enables autoscaling
    k8s_pool_autohealing = bool,   # Enables autohealing
    k8s_pool_min_size    = number, # Min number of nodes
    k8s_pool_max_size    = number  # Max number of nodes
    upgrade_policy    = list(object({
        max_surge       = number # The maximum number of nodes to be created during the upgrade
        max_unavailable = number # The maximum number of nodes that can be not ready at the same time
    }))
  }))
}
