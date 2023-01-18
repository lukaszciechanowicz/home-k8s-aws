resource "aws_instance" "minion01" {
    ami                     = "ami-00faa6924ab0ddfa8"
    instance_type           = "t4g.medium"
    key_name                = "infrastructure-manage"
    count                   = 1

    subnet_id               = "subnet-00d482d7cc76e4754"
    vpc_security_group_ids  = ["${aws_security_group.minions}"]

  credit_specification {
    cpu_credits = "unlimited"
  }
    
    disable_api_termination = "true"

    root_block_device {
        volume_type             = "gp3"
        volume_size             = "50"
        delete_on_termination   = true
    }
    
    associate_public_ip_address = false

    #lifecycle { ignore_changes = ["user_data"] }
    #user_data               = "${data.template_file.userdata.rendered}"

    tags = {
        Name = "dev_eu-west-1_core_eks_minion01_lci"
        "mp:owner" = "CloudEngineering"
        "mp:environment" = "dev"
        "mp:region" = "eu-west-1"
        "mp:service" = "eks"
        "mp:role" = "minion"
        "mp:customer" = "shd"
        "mp:product" = "core"
    }
}