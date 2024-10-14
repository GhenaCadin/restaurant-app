resource "aws_instance" "public_ec2_haproxy" {
  ami                         = var.ami_image
  instance_type               = var.instance_type
  key_name                    = "restaurant-key-3"
  availability_zone           = "eu-west-3a"
  vpc_security_group_ids      = [aws_security_group.public_security_group.id]
  subnet_id                   = aws_subnet.subnet["public_subnet"].id
  associate_public_ip_address = true



  tags = {
    Name = "HAProxy"
  }
}


resource "aws_instance" "private_ec2_client" {
  ami                    = var.ami_image
  instance_type          = var.instance_type
  key_name               = "restaurant-key-3"
  availability_zone      = "eu-west-3b"
  vpc_security_group_ids = [aws_security_group.private_security_group.id]
  subnet_id              = aws_subnet.subnet["private_subnet"].id



  tags = {
    Name = "client"
  }
}

resource "aws_instance" "private_ec2_items" {
  ami                    = var.ami_image
  instance_type          = var.instance_type
  key_name               = "restaurant-key-3"
  availability_zone      = "eu-west-3b"
  vpc_security_group_ids = [aws_security_group.private_security_group.id]
  subnet_id              = aws_subnet.subnet["private_subnet"].id



  tags = {
    Name = "backend_items"
  }
}

resource "aws_instance" "private_ec2_discounts" {
  ami                    = var.ami_image
  instance_type          = var.instance_type
  key_name               = "restaurant-key-3"
  availability_zone      = "eu-west-3b"
  vpc_security_group_ids = [aws_security_group.private_security_group.id]
  subnet_id              = aws_subnet.subnet["private_subnet"].id



  tags = {
    Name = "backend_discounts"
  }
}

resource "aws_instance" "private_ec2_auth" {
  ami                    = var.ami_image
  instance_type          = var.instance_type
  key_name               = "restaurant-key-3"
  availability_zone      = "eu-west-3b"
  vpc_security_group_ids = [aws_security_group.private_security_group.id]
  subnet_id              = aws_subnet.subnet["private_subnet"].id



  tags = {
    Name = "backend_auth"
  }
}

