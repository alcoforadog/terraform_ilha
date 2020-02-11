data "template_file" "nginx_init" {
  template = file("templates/nginx.sh")
}

module "nginx" {
  source                = "./modules/ec2"
  project               = local.project
  name                  = "nginx"
  instance_class        = "t2.micro"
  ami                   = lookup(var.amis, var.aws_region)
  public_subnet_id      = module.network.public_subnet_id
  security_group_ids    = [
    module.network.security_group_ids,
    module.network.ssh_sg_id,
    module.network.http_sg_id
  ]
  key_name              = aws_key_pair.key.key_name
  cloudinit             = data.template_file.nginx_init
}