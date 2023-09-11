resource "aws_instance" "gfg-instance" {
ami =var.ami-key
instance_type = var.instance_type

 tags = {
           Name = var.tag
   }

}