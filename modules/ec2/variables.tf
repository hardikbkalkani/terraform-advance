# modules/ec2/variables.tf
variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet for the EC2 instance"
  type        = string
}

variable "security_group_ids" {
  description = "IDs of the security groups for the EC2 instance"
  type        = list(string)
}