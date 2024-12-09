variable "region" {
  description = "AWS region" # A description for the variable
  type        = string       # The type of the variable (string in this case)
  default     = "us-west-1"  # The default value for the variable
}

variable "clusterName" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "vprofile-eks"
}
