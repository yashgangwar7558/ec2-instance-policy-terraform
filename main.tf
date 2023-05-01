terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "AWS-terraform-7558"

    workspaces {
      name = "ec2-instance-policy-terraform"
    }
  }
}
 
provider "aws" {
  region = "us-east-1"
  alias  = "us-east"
}

locals {
  project_name = "terraform"
}

resource "aws_instance" "my_server" {
  ami           = "ami-06e46074ae430fba6"
  instance_type = var.instance_type

  tags = {
    Name = "MyServer"
  }
}

output "instance_ip_addr" {
  value = aws_instance.my_server.public_ip
}