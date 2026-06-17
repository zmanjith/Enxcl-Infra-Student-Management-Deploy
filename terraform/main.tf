# resource "aws_ecr_repository" "frontend" {
#   name                 = "frontend_repo"
#   image_tag_mutability = "MUTABLE"

#   image_scanning_configuration {
#     scan_on_push = true
#   }
# }

resource "aws_ecr_repository" "image_store" {
    for_each = toset(var.repositories)
    name                 = each.value
    image_tag_mutability = "MUTABLE"
    force_delete          = true
}

resource "aws_key_pair" "enxcl_demo_key" {
    key_name   = "enxcl-demo-key"
    public_key = file("~/.ssh/enxcl_demo_key.pub")
}

resource "aws_instance" "student_management_instance" {
    ami           = data.aws_ami.ubuntu_ami.id
    instance_type = "t3.micro"
    key_name      = aws_key_pair.enxcl_demo_key.key_name
    subnet_id     = data.aws_subnets.default.ids[0]

    # security_groups = [aws_security_group.web_sg.name]

    vpc_security_group_ids = [
     aws_security_group.web_sg.id
    ]

    user_data = file("${path.module}/scripts/user-data.sh")

    tags = {
        Name = "StudentManagementInstance"
    }
}