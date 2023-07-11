resource "aws_subnet" "mysubnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  depends_on = [aws_vpc.main]
  tags = {
    Name = "Main"
  }
}