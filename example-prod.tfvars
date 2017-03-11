terragrunt = {
  # Configure Terragrunt to automatically store tfstate files in an S3 bucket
  remote_state {
    backend = "s3"
    config {
      encrypt = "true"
      bucket  = "example-com-example-prod-terraform"
      key     = "example-service.tfstate"
      region  = "us-east-1"
    }
  }
}

/*
* aws vars for Terraform
*/
svc_name = "example-service"

aws_s3_prefix           = "example-com" # We prefix all S3 buckets by our
                                        # domain name and account name to
                                        # prevent bucket name collisions.
aws_account             = "example-prod" # AWS account name
aws_profile             = "example-prod" # AWS local credentials profile name.
aws_region              = "us-east-1"

asg_min_size            = 30
asg_max_size            = 60
asg_desired_capacity    = 40

# This is a public facing service.
subnet_type = "public"

security_group_service_ingress = {
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_block = "0.0.0.0/0"
}

