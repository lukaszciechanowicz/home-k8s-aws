locals {
    tags = {
        "mp:owner" = "CloudEngineering"
        "mp:environment" = "dev"
        "mp:region" = "eu-west-1"
        "mp:service" = "eks"
        "mp:role" = "minion"
        "mp:customer" = "shd"
        "mp:product" = "core"
    }
}

variable "minions_ami" {
    type = map(string)
    default = "ami-00faa6924ab0ddfa8"
}

variable "minions_instance_type" {
    type = map(string)
    default = "t3.medium"
}

variable "minions_subnet_id" {
    type = map(string)
    default = "subnet-00d482d7cc76e4754"
  
}

variable "instance_key_name"   { default = "infrastructure-manage" }