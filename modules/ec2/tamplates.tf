data "template_cloudinit_config" "cloudinit" {
    gzip          = false
    base64_encode = false

    part {
        content_type = "text/x-shellscript"
        content      = var.cloudinit.rendered
    }
}