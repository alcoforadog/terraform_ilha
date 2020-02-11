resource "aws_instance" "instance" {
    ami             = var.ami
    instance_type   = var.instance_class
    subnet_id       = var.public_subnet_id

    vpc_security_group_ids = flatten([var.security_group_ids])

    key_name        = var.key_name
    user_data       = data.template_cloudinit_config.cloudinit.rendered

    tags = {
        Name = "${var.project}-${var.name}-instance"
    }
}