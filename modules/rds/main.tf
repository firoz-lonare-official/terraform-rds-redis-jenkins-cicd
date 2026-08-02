resource "aws_db_subnet_group" "mysql" {

  name = "${var.name}-subnet-group"

  subnet_ids = var.private_subnet_ids


  tags = {

    Name = "${var.name}-subnet-group"

  }

}


resource "aws_security_group" "rds" {

  name = "${var.name}-rds-sg"

  description = "Allow MySQL access from application servers"

  vpc_id = var.vpc_id


  ingress {

    from_port = 3306

    to_port = 3306

    protocol = "tcp"

    security_groups = [
      var.app_security_group_id
    ]

  }


  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }


  tags = {

    Name = "${var.name}-rds-sg"

  }

}



resource "aws_db_instance" "mysql" {


  identifier = var.name


  engine = "mysql"


  engine_version = "8.0"


  instance_class = "db.t3.micro"


  allocated_storage = 20



  username = var.username


  password = var.password



  db_subnet_group_name = aws_db_subnet_group.mysql.name



  vpc_security_group_ids = [

    aws_security_group.rds.id

  ]



  storage_encrypted = true



  backup_retention_period = 0



  backup_window = "03:00-04:00"



  maintenance_window = "sun:04:00-sun:05:00"



  multi_az = true



  publicly_accessible = false



  skip_final_snapshot = true



  tags = {

    Name = var.name

  }


}