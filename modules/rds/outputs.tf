output "db_endpoint" {

  description = "MySQL RDS endpoint"

  value = aws_db_instance.mysql.endpoint

}


output "db_port" {

  description = "MySQL database port"

  value = aws_db_instance.mysql.port

}


output "db_security_group_id" {

  description = "RDS security group id"

  value = aws_security_group.rds.id

}