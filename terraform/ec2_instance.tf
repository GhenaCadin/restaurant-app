resource "aws_instance" "public_ec2_haproxy" {
  ami                         = var.ami_image
  instance_type               = var.instance_type
  key_name                    = "restaurant-key"
  availability_zone           = "eu-west-1a"
  vpc_security_group_ids      = [aws_security_group.public_security_group.id]
  subnet_id                   = aws_subnet.subnet["public_subnet"].id
  associate_public_ip_address = true
  user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is our public VM</h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name = "HAProxy"
  }
}


resource "aws_instance" "private_ec2_frontend" {
  ami                         = var.ami_image
  instance_type               = var.instance_type
  key_name                    = "restaurant-key"
  availability_zone           = "eu-west-1b"
  vpc_security_group_ids      = [aws_security_group.private_security_group.id]
  subnet_id                   = aws_subnet.subnet["private_subnet"].id
  user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is our private VM for front-end! </h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name = "frontend"
  }
}

resource "aws_instance" "private_ec2_items" {
  ami                         = var.ami_image
  instance_type               = var.instance_type
  key_name                    = "restaurant-key"
  availability_zone           = "eu-west-1b"
  vpc_security_group_ids      = [aws_security_group.private_security_group.id]
  subnet_id                   = aws_subnet.subnet["private_subnet"].id
  user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is our private VM for items!</h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name = "backend_items"
  }
}

resource "aws_instance" "private_ec2_discounts" {
  ami                         = var.ami_image
  instance_type               = var.instance_type
  key_name                    = "restaurant-key"
  availability_zone           = "eu-west-1b"
  vpc_security_group_ids      = [aws_security_group.private_security_group.id]
  subnet_id                   = aws_subnet.subnet["private_subnet"].id
  user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is our private VM for discounts!</h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name = "backend_discounts"
  }
}

resource "aws_instance" "private_ec2_auth" {
  ami                         = var.ami_image
  instance_type               = var.instance_type
  key_name                    = "restaurant-key"
  availability_zone           = "eu-west-1b"
  vpc_security_group_ids      = [aws_security_group.private_security_group.id]
  subnet_id                   = aws_subnet.subnet["private_subnet"].id
  user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is our private VM for auth!</h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name = "backend_auth"
  }
}

