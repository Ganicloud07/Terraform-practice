provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "key" {
  key_name   = "gani-key"
  public_key = file("gani-key.pub")
}

resource "aws_instance" "ec2" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key.key_name

  tags = {
    Name = "remote-exec-demo"
  }
}

resource "null_resource" "setup" {

  depends_on = [aws_instance.ec2]

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("gani-key.pem")
    host        = aws_instance.ec2.public_ip
  }
}
