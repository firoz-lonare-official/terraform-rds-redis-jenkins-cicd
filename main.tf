provider "aws" {

  region = var.aws_region

}



# VPC Module

module "vpc" {

  source = "./modules/vpc"


  vpc_cidr = "10.0.0.0/16"


  public_subnet_cidrs = [

    "10.0.1.0/24",

    "10.0.2.0/24"

  ]


  private_subnet_cidrs = [

    "10.0.11.0/24",

    "10.0.12.0/24"

  ]


  availability_zones = [

    "us-east-1a",

    "us-east-1b"

  ]

}



# Application Security Group

resource "aws_security_group" "app" {

  name = "application-sg"


  description = "Security group for application servers"


  vpc_id = module.vpc.vpc_id



  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [

      "0.0.0.0/0"

    ]

  }



  tags = {

    Name = "application-sg"

  }

}




# RDS Module

module "rds" {

  source = "./modules/rds"



  name = "production-mysql"



  vpc_id = module.vpc.vpc_id



  private_subnet_ids = module.vpc.private_subnet_ids



  app_security_group_id = aws_security_group.app.id



  username = var.db_username



  password = var.db_password

}

# Redis Module

module "redis" {

  source = "./modules/redis"


  name = "production-redis"


  vpc_id = module.vpc.vpc_id


  private_subnet_ids = module.vpc.private_subnet_ids


  security_group_ids = [

    aws_security_group.app.id

  ]


  node_type = "cache.t3.micro"


  engine_version = "7.1"


  num_cache_clusters = 2

}