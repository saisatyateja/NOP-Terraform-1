resource "aws_security_group" "mysg" {
  name        = "mysg"
  description = "NopCommerce security group"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "ssh"
    cidr_blocks      = ["0.0.0.0"]
  }
  depends_on= [aws_vpc.main]
  tags = {
    Name = "allow_tls"
  }
}