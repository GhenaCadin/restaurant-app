output "public_ip_address" {

  value = aws_instance.public_ec2_haproxy.public_ip

}

