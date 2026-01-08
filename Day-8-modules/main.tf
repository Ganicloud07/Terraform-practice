resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.type

    
    tags ={
        Name = var.instance_name
  
}
}