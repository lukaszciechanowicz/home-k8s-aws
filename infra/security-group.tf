resource "aws_security_group" "minions" {
  name        = "dev_eu-west-1_core_eks_worker_lci"
  description = "LCI EKS Minions Security Group"
  vpc_id      = "vpc-0de553810614679b4"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.35.128.0/17"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "dev_eu-west-1_core_eks_worker_lci"
    "mp:owner" = "CloudEngineering"
    "mp:environment" = "dev"
    "mp:region" = "eu-west-1"
    "mp:service" = "eks"
    "mp:role" = "minion"
    "mp:customer" = "shd"
    "mp:product" = "core"    
  }
}