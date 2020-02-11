output "id" {
    value = aws_instance.instance.id
}
output "public_ip" {
    value = aws_instance.instance.public_ip
}
output "public_url" {
    value = aws_instance.instance.public_dns
}