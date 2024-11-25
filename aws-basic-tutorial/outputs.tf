
output "instance_public_ip-redis-1" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.redis-1.public_ip
}


output "instance_public_ip-redis-2" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.redis-2.public_ip
}


output "instance_public_ip-redis-3" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.redis-3.public_ip
}

output "instance_public_ip-redis-4" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.redis-4.public_ip
}