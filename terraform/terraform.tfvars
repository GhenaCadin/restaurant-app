region = "eu-west-1"

availability_zone = {
  private_subnet_az = "eu-west-1b"
  public_subnet_az  = "eu-west-1a"
}

cidr_block = "10.0.0.0/16"

vpc_name = "restaurant-app-VPC"

public_subnet_cidr_block = "10.0.1.0/24"

private_subnet_cidr_block = "10.0.2.0/24"

ami_image = "ami-0d64bb532e0502c46"

instance_type = "t2.micro"

subnets = {
  public_subnet = {
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "eu-west-1a"
  }

  private_subnet = {
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = false
    availability_zone = "eu-west-1b"
  }
}

inbound_rule = {
  allow_http_traffic = {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  allow_ssh_traffic = {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  allow_https_traffic = {

    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

