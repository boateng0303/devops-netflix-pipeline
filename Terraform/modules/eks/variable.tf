variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for EKS cluster"
  type        = list(string)
}

variable "node_subnet_ids" {
  description = "Subnet IDs for EKS node group"
  type        = list(string)
}

variable "node_instance_types" {
  description = "Instance types for EKS nodes"
  type        = list(string)
}

variable "node_scaling_config" {
  description = "Scaling configuration for node group"
  type = object({
    desired_size = number
    max_size     = number
    min_size     = number
  })
}