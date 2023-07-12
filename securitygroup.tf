resource "aws_security_group" "mysg" {
  name        = "mysg"
  description = "NopCommerce security group"
  vpc_id      = aws_vpc.main.id
  ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  ingress {
        from_port = 5000
        to_port =5000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = -1
        to_port     = -1
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  depends_on= [aws_vpc.main]
  tags = {
    Name = "allow_tls"
  }
}