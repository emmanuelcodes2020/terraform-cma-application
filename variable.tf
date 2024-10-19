variable "name_prefix" {
  default = "CMA-GLOBAL"
  type = string
}


variable "zone_id" {
  type = string
  description = "zone id"
  default = "Z0671589BT7MHBSY40SQ"
}



variable "ami_id" {
    default = "ami-019a292cfb114a776"
    type = string
  
}

variable "instance_type" {
  default = "t3.medium"
  type = string
}

variable "desired_capacity" {
    default = 1
    type = number
}

variable "min_size" {
    default = 1
    type = number
}


variable "max_size" {
    default = 2
    type = number
}

variable "subnet_id" {
  default = "subnet-02a9e5d00bbb8cc25"
  type    = string

}
variable "subnet_ranges" {
  type = list(string)
  default = ["subnet-02a9e5d00bbb8cc25", "subnet-0644c8c5d8ada7398", "subnet-04fb6726c16bdd4ca"]
  }

  variable "scaling_adjustment" {
    type = number
    default = 4
  }


  variable "env" {
    type = string
    default = "dev"
  }

  variable "vpc_id" {
  type    = string
  default = "vpc-043e1dc52827b0366"

}
 variable "key_name" {
   default =  "londonserver"
   type = string
 }

 variable "volume_size" {
  default = 11
  type = number
   
 }

 variable "ebs_volume_size" {
  default = 13
  type = number
   
 }

 variable "root_volume_size" {
  default = 10
  type = number
   
 }



 variable "device_name" {
   default =  "/dev/sdf"
   type = string
 }

 variable "load_balancer_type" {
   default = "network"
   type = string
 }

 variable "target_type" {
   default = "instance"
   type = string
 }



variable "volume_type" {
  type = string
  description = "EBS Volume Type"
  default = "gp3"
}

variable "ebs_volumes" {
  description = "List of EBS volume configurations"
  type = list(object({
    device_name = string
    volume_size = number
    volume_type = string
  }))

  default = [ {
    
    device_name = "/dev/sda1"
    volume_size = 5
    volume_type = "gp3"

  },

{
   device_name = "/dev/sdb"
   volume_size = 6
   volume_type = "gp3"

  },

{
    
    device_name = "/dev/sdc"
    volume_size = 7
    volume_type = "gp3"

  }

]
}