resource "aws_ecs_cluster" "chusrodriguez" {
  name = "chusrodriguez-${var.environment}"
}

resource "aws_ecs_service" "chusrodriguez-app" {
  name = "chusrodriguez-app"
  cluster = "${aws_ecs_cluster.chusrodriguez.id}"
  task_definition = "${aws_ecs_task_definition.chusrodriguez-task.arn}"
  desired_count = 3
  iam_role = "${aws_iam_role.foo.arn}"
  depends_on = ["aws_iam_role_policy.foo"]

  load_balancer {
    elb_name = "${aws_elb.foo.name}"
    container_name = "mongo"
    container_port = 8080
  }
}

resource "aws_ecs_task_definition" "chusrodriguez-task" {
  family = "jenkins"
  container_definitions = "${file("files/chusrodriguez.json")}"

  volume {
    name = "jenkins-home"
    host_path = "/ecs/jenkins-home"
  }
}
