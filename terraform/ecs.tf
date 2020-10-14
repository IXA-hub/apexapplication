resource "aws_ecs_cluster" "example" {
    name = "example"
}

resource "aws_ecs_task_definition" "example" {
    family = "example"
    cpu = "256"
    memory = "512"
    network_mode = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    container_definitions = file("./container_definitions.json")
}

resource "aws_ecs_service" "example" {
    name = "example"
    cluster = aws_ecs_cluster.example.arn
    task_definition = aws_ecs_task_definition.example.arn
    desired_count = 2
    launch_type = "FARGATE"
    platform_version = "1.3.0"
    health_check_grace_period_seconds = 60

    network_configuration {
        assign_public_ip = false
        security_groups = [aws_security_group.nginx_sg.id]

        subnets = [
            aws_subnet.private_01.id,
            aws_subnet.private_02.id
        ]
    }

    load_balancer {
        target_group_arn = aws_lb_target_group.example.arn
        container_name = "example"
        container_port = 80
    }

    lifecycle {
        ignore_changes = [task_definition]
    }
}

resource "aws_security_group" "nginx_sg" {
    name = "nginx_sg"
    vpc_id = aws_vpc.example.id
}

resource "aws_security_group_rule" "nginx_ingress" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.nginx_sg.id
}

resource "aws_security_group_rule" "egress" {
    type = "egress"
    from_port = 80
    to_port = 80
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.nginx_sg.id
}
