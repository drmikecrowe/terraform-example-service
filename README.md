# Example Service

This repo is for deploying infrastructure for the Example Service via
Terraform.  It uses our __tf_example_svc__ module to create its security
groups, Launch configuration, autoscaling groups, etc.  See the
example-{dev,prod}.tfvars files to see how the service is configured in each
environment.

