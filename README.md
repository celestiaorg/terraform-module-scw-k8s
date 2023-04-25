## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | 2.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | 2.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [scaleway_k8s_cluster.k8s-cluster](https://registry.terraform.io/providers/scaleway/scaleway/2.10.0/docs/resources/k8s_cluster) | resource |
| [scaleway_k8s_pool.k8s-cluster-pool](https://registry.terraform.io/providers/scaleway/scaleway/2.10.0/docs/resources/k8s_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_balance_similar_node_groups"></a> [balance\_similar\_node\_groups](#input\_balance\_similar\_node\_groups) | Detect similar node groups and balance the number of nodes between them. | `bool` | `true` | no |
| <a name="input_cluster_description"></a> [cluster\_description](#input\_cluster\_description) | A description for the Kubernetes cluster. | `string` | `"Cluster Description"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name for the Kubernetes cluster. | `string` | `"k8s-cluster-name"` | no |
| <a name="input_delete_additional_resources"></a> [delete\_additional\_resources](#input\_delete\_additional\_resources) | Delete additional resources like block volumes, IPs and loadbalancers that were created in Kubernetes on cluster deletion | `bool` | `false` | no |
| <a name="input_disable_scale_down"></a> [disable\_scale\_down](#input\_disable\_scale\_down) | Disables the scale down feature of the autoscaler. | `bool` | `false` | no |
| <a name="input_estimator"></a> [estimator](#input\_estimator) | Type of resource estimator to be used in scale up. | `string` | `"binpacking"` | no |
| <a name="input_expander"></a> [expander](#input\_expander) | Type of node group expander to be used in scale up. | `string` | `"random"` | no |
| <a name="input_expendable_pods_priority_cutoff"></a> [expendable\_pods\_priority\_cutoff](#input\_expendable\_pods\_priority\_cutoff) | Pods with priority below cutoff will be expendable. | `string` | `"-5"` | no |
| <a name="input_ignore_daemonsets_utilization"></a> [ignore\_daemonsets\_utilization](#input\_ignore\_daemonsets\_utilization) | Ignore DaemonSet pods when calculating resource utilization for scaling down. | `bool` | `true` | no |
| <a name="input_k8s_cni"></a> [k8s\_cni](#input\_k8s\_cni) | CNI | `string` | `"cilium"` | no |
| <a name="input_k8s_pools"></a> [k8s\_pools](#input\_k8s\_pools) | ============================================== Kubernetes Pool Config ============================================== | <pre>list(object({<br>    k8s_pool_name        = string, // Pool name<br>    k8s_pool_type        = string, // Type of the node<br>    k8s_pool_size        = number, // This field will only be used at creation if autoscaling is enabled.<br>    container_runtime    = string, // Container runtime<br>    k8s_pool_autoscaling = bool,   // Enables autoscaling<br>    k8s_pool_autohealing = bool,   // Enables autohealing<br>    k8s_pool_min_size    = number, // Min number of nodes<br>    k8s_pool_max_size    = number  // Max number of nodes<br>  }))</pre> | n/a | yes |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | K8S Version | `string` | `"1.26.0"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID, you can find them here: https://console.scaleway.com/project/settings | `string` | `"YOU-NEED-TO-SPECIFY-IT"` | no |
| <a name="input_region"></a> [region](#input\_region) | Cluster's region: fr-par, nl-ams, pl-waw | `string` | `"nl-ams"` | no |
| <a name="input_scale_down_delay_after_add"></a> [scale\_down\_delay\_after\_add](#input\_scale\_down\_delay\_after\_add) | How long after scale up that scale down evaluation resumes. | `string` | `"5m"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag list | `list(any)` | <pre>[<br>  "dev"<br>]</pre> | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Cluster's zone: [fr-par-1 fr-par-2 fr-par-3 nl-ams-1 nl-ams-2 pl-waw-1 pl-waw-2] | `string` | `"nl-ams-1"` | no |

## Outputs

No outputs.
