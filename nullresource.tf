resource "null_resource" "remote"{
    connection {
       type = "ssh"
       user = "ubuntu"
       private_key = file("virginia.pem")
       host  = aws_instance.web.public_ip
}
provisioner "remote-exec" {
         inline = [
                    "sudo apt-get update",
                    "sudo apt install dotnet-sdk-7.0 -y",
                    "git clone https://github.com/4mmnnn/nopCommerceJuly23.git",
                    "cd nopCommerceJuly23/",
                    "dotnet build src/NopCommerce.sln",
                    "cd src/Presentation/Nop.Web",
                    "dotnet publish Nop.Web.csproj -c Release -o /home/ubuntu/nop",
                    "dotnet /home/ubuntu/nop/Nop.Web.dll --URLS='http://0.0.0.0:5000'"
                  ]
  }
  }