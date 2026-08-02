# Redis Subnet Group

resource "aws_elasticache_subnet_group" "redis" {

  name = "${var.name}-subnet-group"


  subnet_ids = var.private_subnet_ids


  tags = {

    Name = "${var.name}-subnet-group"

  }

}



# Redis Replication Group

resource "aws_elasticache_replication_group" "redis" {

  replication_group_id = var.name


  description = "Redis replication group for application caching"


  engine = "redis"


  engine_version = var.engine_version


  node_type = var.node_type


  num_cache_clusters = var.num_cache_clusters


  port = 6379


  subnet_group_name = aws_elasticache_subnet_group.redis.name


  security_group_ids = var.security_group_ids



  automatic_failover_enabled = true


  multi_az_enabled = true



  at_rest_encryption_enabled = true


  transit_encryption_enabled = true



  tags = {

    Name = var.name

  }

}