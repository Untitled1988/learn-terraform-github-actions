output "DNS" {
  value = aws_instance.web.public_dns
  description = "The public DNS name of the instance"
}

output "IP" {
  value = aws_instance.web.public_ip
  description = "The public IP address of the instance"
  sensitive = true
}
