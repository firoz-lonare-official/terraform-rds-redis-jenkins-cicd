output "rds_endpoint" {

  description = "Production MySQL RDS endpoint"

  value = module.rds.db_endpoint

}


output "rds_port" {

  description = "MySQL port"

  value = module.rds.db_port

}


output "rds_security_group_id" {

  description = "RDS Security Group ID"

  value = module.rds.db_security_group_id

}
output "redis_endpoint" {

  description = "Redis primary endpoint"

  value = module.redis.redis_endpoint

}


output "redis_port" {

  description = "Redis port"

  value = module.redis.redis_port

}


output "redis_id" {

  description = "Redis replication group ID"

  value = module.redis.redis_id

}