terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.25.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23.0"
    }
  }

# Backend is very important so that it saves the state management instruction on a central s3 bucket location instaed of locally on your computer, which may result to alot of issues
#as it wouyld recreate the instruction again for different developers running the terraform
    backend "s3" {
    bucket = "vprofile-app-actions"     # The name of the S3 bucket where Terraform will store the state
    key    = "terraform.tfstate"         # The path within the S3 bucket to the state file
    region = "us-west-1"                 # The AWS region where the S3 bucket is located
  }
  
  # required_version = "~> 1.6.3"
}
##b
##
##
