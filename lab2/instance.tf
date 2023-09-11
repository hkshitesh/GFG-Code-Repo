
resource "aws_instance" "ec2_example" {

   ami           = "ami-06f621d90fa29f6d0"
   instance_type =  var.instance_type

   tags = {
           Name = "My-GFG-Instance"
   }
} 
