
# EC2
module "ec2_win" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.19.0"

  for_each = var.ec2_win_list

  name           = "${var.ec2_win.name_prefix}-${each.key}-WIN"
  instance_count = 1

  ami           = var.ec2_win.ami
  instance_type = var.ec2_win.instance.type

  subnet_ids                  = var.subnets
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = false

  enable_volume_tags = false
  root_block_device  = var.ec2_win.root_block_device

  user_data = file("${path.module}/setting/user_data.ps")

  disable_api_termination = var.ec2_win.disable_api_termination

  tags = {
    project = var.project_name
    env     = var.env_name
  }
}
