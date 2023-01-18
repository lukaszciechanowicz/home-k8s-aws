resource "aws_instance" "minion" {
    ami                     = var.minions_ami
    instance_type           = var.minions_instance_type
    key_name                = var.instance_key_name
    count                   = 1

    subnet_id               = var.minions_subnet_id
    vpc_security_group_ids  = ["${aws_security_group.minions.id}"]

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

    # lifecycle { ignore_changes = ["user_data"] }
    # user_data = "${data.template_file.userdata.rendered}"
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
