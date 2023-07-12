output "nopurl" {     
    value = format("http://%s:5000",aws_instance.web.public_ip)   
    }
