resource "aws_internet_gateway" "restaurant_gateway" {
  vpc_id = aws_vpc.restaurant_vpc.id
  tags = {
    Name = "restaurant_gateway"
  }
}

