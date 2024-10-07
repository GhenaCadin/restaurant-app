resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.restaurant_vpc.id
  tags = {
    Name = "gw"
  }
}

