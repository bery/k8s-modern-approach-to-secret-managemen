resource "aws_secretsmanager_secret" "user" {
  name = "sandbox/grafana/user"
}

resource "aws_secretsmanager_secret" "password" {
  name = "sandbox/grafana/password"
}

resource "aws_secretsmanager_secret_version" "user" {
  secret_id     = aws_secretsmanager_secret.user.id
  secret_string = random_pet.user.id
  lifecycle {
    ignore_changes = [
      secret_string
    ]
  }
}

resource "aws_secretsmanager_secret_version" "password" {
  secret_id     = aws_secretsmanager_secret.password.id
  secret_string = random_password.password.result
  lifecycle {
    ignore_changes = [
      secret_string
    ]
  }
}

resource "random_pet" "user" {
    length    = 2
}

resource "random_password" "password" {
  length           = 16
  special          = true
  keepers = {
    region = timestamp()
  }
}