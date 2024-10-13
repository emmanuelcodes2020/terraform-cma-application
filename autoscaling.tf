resource "aws_launch_template" "cma_lt" {
  name_prefix = var.name_prefix
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name  = var.key_name
  vpc_security_group_ids = [aws_security_group.cma_autoscaling_sg.id]

  dynamic "block_device_mappings" {

    for_each = var.ebs_volumes
    content {
    device_name = block_device_mappings.value.device_name
    ebs {

      volume_size = block_device_mappings.value.volume_size
      volume_type = block_device_mappings.value.volume_type
  
    }
 }
  }
  user_data = filebase64("${path.module}/userdata.sh")
  
}

resource "aws_autoscaling_group" "cma_asg_group" {
  name               = "CMA-ASG"
  desired_capacity   = var.desired_capacity
  min_size           = var.min_size 
  max_size             = var.max_size
  vpc_zone_identifier  = var.subnet_ranges
  

  

  launch_template {
    id      = aws_launch_template.cma_lt.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "CMA-Application"
    propagate_at_launch = true
  }
}


resource "aws_autoscaling_policy" "cma_asg_policy" {
  name                   = "CMA_asg_policy"
  scaling_adjustment     = var.scaling_adjustment 
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.cma_asg_group.name
  
}
