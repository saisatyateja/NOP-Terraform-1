#!/bin/bash
 sudo apt update
 sudo apt install dotnet-sdk-7.0 -y
 git clone https://github.com/4mmnnn/nopCommerceJuly23.git
 cd nopCommerceJuly23/
  dotnet build src/NopCommerce.sln
  cd src/Presentation/Nop.Web
  dotnet publish Nop.Web.csproj -c Release -o /home/ubuntu/nop
  cd /home/ubuntu/nop
  dotnet Nop.Web.dll --URLS="http://0.0.0.0:5000"
