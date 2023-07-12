data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.medium"
  associate_public_ip_address = true     
  key_name = "mykeypair"      
  subnet_id = aws_subnet.mysubnet[0].id     
  user_data = file("apache.sh")     
  vpc_security_group_ids = [aws_security_group.mysg.id]

  tags = {
    Name = "HelloWorld"
  }
  output "apacheurl" {     
    value = format("http://%s:5000",aws_instance.apache.web_ip)   
    }
}