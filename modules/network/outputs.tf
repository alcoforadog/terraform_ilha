output "vpc_id" {
    value = aws_vpc.main.id
}
output "public_subnet_id" {
    value = aws_subnet.public.0.id
}
output "security_group_ids" {
    value = [ 
        aws_security_group.main.id,
        aws_security_group.internet.id
    ]
}
output "ssh_sg_id" {
    value = aws_security_group.ssh.id
}
output "http_sg_id" {
    value = aws_security_group.http.id
}