output "nopurl" {     
    value = format("http://%s:5000",aws_instance.apache.web_ip)   
    }
