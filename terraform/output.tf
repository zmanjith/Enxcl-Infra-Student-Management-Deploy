# output "frontend_repo_url" {
#   value = aws_ecr_repository.frontend.repository_url
# }

# output "backend_repo_url" {
#   value = aws_ecr_repository.backend.repository_url
# }


output "frontend_url" {
  value = aws_ecr_repository.image_store["frontend-repo"].repository_url
}

output "backend_url" {
  value = aws_ecr_repository.image_store["backend-repo"].repository_url
}

output "public_ip" {
  value = aws_instance.student_management_instance.public_ip
}

output "public_dns" {
  value = aws_instance.student_management_instance.public_dns
}