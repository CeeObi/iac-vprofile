module "eks" { #Using terraform module so we do not get to write the entire code.
  # EKS info
  source  = "terraform-aws-modules/eks/aws"
  version = "19.19.1"

  cluster_name    = local.cluster_name #from main.tf file
  cluster_version = "1.27"

  vpc_id                         = module.vpc.vpc_id          #vpc module defined from vpc.tf file   
  subnet_ids                     = module.vpc.private_subnets #vpc module defined from vpc.tf file   
  cluster_endpoint_public_access = true                       #to enable public access

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  # # EKS nodes info
  eks_managed_node_groups = { #node group is simply auto scaling group
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "node-group-2"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}
