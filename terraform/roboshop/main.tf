resource "aws_spot_instance_request" "cheap_worker" {
     count =  length(var.components)
    ami           =  data.aws_ami.ami.id
    instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-017e24d5e5f10677e"]

  tags = {
    Name = element(var.components, count.index )
  }
}
resource "aws_ec2_tag" "tags" {
  count =  length(var.components)
  resource_id =element (aws_spot_instance_request.cheap_worker .*.spot_instance_id, count.index)
  key         = "Name"
  value  = element(var.components, count.index )
}
data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "^cent*"
  owners      = ["973714476881"]
}

variable "components" {
  default =  ["frontend", "mongodb" ,"catalogue" , "cart" ,"user" ,"redis", "mysql", "shipping" , "rabbitmq", "payment"]
}

provider "ami" {
  region = "us-east-1"
}