output "public_ip" {
  value = aws_instance.name.public_ip
}

output "private_Ip" {
    value = aws_instance.name.private_ip
  
}