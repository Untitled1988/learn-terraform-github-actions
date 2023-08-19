variable "region" {
  type    = string
  default = "ap-northeast-1"
  description = "Region"
}

variable "amis" {
  type    = map
  default = {
    ap-northeast-1 = "ami-0d52744d6551d851e"
  }
  description = "AMI ID"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
  description = "Instance Type"
}


variable "public_key" {
  type    = string
  default = "id_rsa.pub"
  description = "ssh public key"
}

