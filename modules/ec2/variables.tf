variable "project" {
  description = "The project"
}
variable "name" {
  description = "The ec2 name"
}
variable "instance_class" {
  description = "The azs to use"
}
variable "ami" {
  description = "The region to launch the bastion host"
}
variable "public_subnet_id" {
  description = "The public subnets to use"
}
variable "security_group_ids" {
  description = "The default security group"
}
variable "key_name" {
  description = "Public ssh key name"
}
variable "cloudinit" {
  description = "init file"
}