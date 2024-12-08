module "vpc" {
  # We use module so that we do not need to write all the code. it copies from module. Refer to the modeule to see the codes you would have written.
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "vprofile-eks"

  cidr = "172.20.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 3) #from the main.tf file

  private_subnets = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]
  public_subnets  = ["172.20.4.0/24", "172.20.5.0/24", "172.20.6.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true


#Define public and private tags: general requirement for eks in the format as well
  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"      #local.cluster_name - from the main.tf file.
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared" 
    "kubernetes.io/role/internal-elb"             = 1
  }
}
