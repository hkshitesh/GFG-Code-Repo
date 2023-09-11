variable "ami-key" {
    type = string
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "tag" {
    type = string 
    default = "My-Default-Instance" 
}