variable "environment" {}
variable "aws_region" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "key_path" {}

variable "availability_zones" {
  default = { 
    us-east-1 = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
  }
}
variable "amis" {
  default = { 
    us-east-1 = "ami-07ebfd5b3428b6f4d"
}
}