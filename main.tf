/*
* Example service
*/

// Variables
variable "svc_name" {}
variable "aws_s3_prefix" {}
variable "aws_account" {}
variable "aws_profile" {}
variable "aws_region" {}
variable "asg_min_size" {}
variable "asg_max_size" {}
variable "asg_desired_capacity" {}
variable "subnet_type" {}
variable "security_group_service_ingress" { type = "map" }


// Setup AWS provider
provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}

// Deploy this service using our module
module "svc" {
  source                = "github.com/threatstack/tf_example_svc"
  svc_name              = "${var.svc_name}"
  aws_account           = "${var.aws_account}"
  aws_region            = "${var.aws_region}"
  subnet_type           = "${var.subnet_type}"
  asg_min_size          = "${var.asg_min_size}"
  asg_max_size          = "${var.asg_max_size}"
  asg_desired_capacity  = "${var.asg_desired_capacity}"
  security_group_service_ingress_external = "${var.security_group_service_ingress}"
}

// outputs
output "instance_type" {
  value = "${module.svc.instance_type}"
}

output "image_id" {
  value = "${module.svc.image_id}"
}

output "launch_config_id" {
  value = "${module.svc.launch_config_id}"
}

output "autoscaling_group_id" {
  value = "${module.svc.autoscaling_group_id}"
}

output "autoscaling_group_name" {
  value = "${module.svc.autoscaling_group_name}"
}

output "autoscaling_group_availability_zones" {
  value = "${module.svc.autoscaling_group_availability_zones}"
}

output "autoscaling_group_min_size" {
  value = "${module.svc.autoscaling_group_min_size}"
}

output "autoscaling_group_max_size" {
  value = "${module.svc.autoscaling_group_max_size}"
}

output "autoscaling_group_desired_capacity" {
  value = "${module.svc.autoscaling_group_desired_capacity}"
}

output "autoscaling_group_launch_configuration" {
  value = "${module.svc.autoscaling_group_launch_configuration}"
}

output "autoscaling_group_vpc_zone_identifier" {
  value = "${module.svc.autoscaling_group_vpc_zone_identifier}"
}

output "iam_role_arn" {
  value = "${module.svc.iam_role_arn}"
}

output "iam_role_name" {
  value = "${module.svc.iam_role_name}"
}

output "iam_instance_profile_arn" {
  value = "${module.svc.iam_instance_profile_arn}"
}

output "iam_instance_profile_name" {
  value = "${module.svc.iam_instance_profile_name}"
}

output "iam_instance_profile_roles" {
  value = "${module.svc.iam_instance_profile_roles}"
}

output "security_group_id" {
  value = "${module.svc.security_group_id}"
}

output "security_group_vpc_id" {
  value = "${module.svc.security_group_vpc_id}"
}

output "security_group_name" {
  value = "${module.svc.security_group_name}"
}

