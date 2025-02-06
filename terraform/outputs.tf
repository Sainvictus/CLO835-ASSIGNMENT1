output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "webapp_repository_url" {
  description = "URL of the webapp ECR repository"
  value       = aws_ecr_repository.webapp.repository_url
}

output "mysql_repository_url" {
  description = "URL of the MySQL ECR repository"
  value       = aws_ecr_repository.mysql.repository_url
}